#!/usr/bin/env bash
# ============================================================================
# Installs dark-souls-grub into /boot/grub/themes/ and wires it into /etc/default/grub.
# ----------------------- AVAILABLE OPTIONS: ---------------------------------
#   sudo ./install.sh                       # pick background interactively (or keep the current one)
#   sudo ./install.sh 03                    # background by number  -> backgrounds/[03]-*.png
#   sudo ./install.sh Sister-Friede         # background by name fragment
#   sudo ./install.sh 03 --no-resize        # copy the image untouched (no ImageMagick re-encode)
#   sudo ./install.sh --no-config           # copy files only; leave /etc/default/grub and grub.cfg alone
#   ./install.sh --list                     # list the available backgrounds
#   ./install.sh --help                     # show this help menu
#
# Re-running it is how you switch backgrounds. Nothing in the repo is modified.
# ============================================================================
set -euo pipefail

# Find the script's location
SRC=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Configuration variables
NAME=dark-souls-grub
GRUB_DIR=${GRUB_DIR:-/boot/grub}
DEST="$GRUB_DIR/themes/$NAME"
DEFAULTS=/etc/default/grub

# Helper functions
die()  { echo "error: $*" >&2; exit 1; }
info() { echo ":: $*"; }

# Find available backgrounds
shopt -s nullglob
backgrounds=("$SRC"/backgrounds/*.png "$SRC"/backgrounds/*.jpg "$SRC"/backgrounds/*.jpeg "$SRC"/backgrounds/*.tga)
[[ ${#backgrounds[@]} -gt 0 ]] || die "no images in $SRC/backgrounds"

# Function to list the available backgrounds with numbered entries
list_backgrounds() {
    local i=1
    for f in "${backgrounds[@]}"; do
        printf ' %d) %s\n' "$i" "$(basename "$f")"
        ((i++))
    done
}

# Parse CLI args
CONFIG=1; RESIZE=1; CHOICE=""
for arg in "$@"; do
    case $arg in
        --list)      list_backgrounds; exit 0 ;;
        --no-config) CONFIG=0 ;;
        --no-resize) RESIZE=0 ;;
        -h|--help)   sed -n '4,11p' "$0"; exit 0 ;;
        *)           CHOICE=$arg ;;
    esac
done

# Check permissions and directories
[[ $EUID -eq 0 ]] || die "run as root (sudo $0)"
[[ -d $GRUB_DIR ]] || die "$GRUB_DIR does not exist - set GRUB_DIR=/boot/grub2 (or wherever grub.cfg lives)"

# --------------------------------
# Choose the background
# Two ways to choose a background:
#   * Pass the number or filename(without number) as a CLI arg
#   * Choose interactively
# --------------------------------
pick=""
# Selection via CLI arg
if [[ -n $CHOICE ]]; then
    # File number?
    if [[ $CHOICE =~ ^[0-9]+$ ]]; then
        # Normalize the number
        n=$(printf '%02d' "$((10#$CHOICE))")
        for f in "${backgrounds[@]}"; do
            [[ $(basename "$f") == "[$n]"* ]] && { pick=$f; break; };
        done
    # Filename?
    else
        for f in "${backgrounds[@]}"; do
            [[ $(basename "$f") == *"$CHOICE"* ]] && { pick=$f; break; };
        done
    fi
    # No match found for file number/name
    [[ -n $pick ]] || { echo "no background matches '$CHOICE':"; list_backgrounds; exit 1; }
# Interactive selection
elif [[ -t 0 ]]; then
    echo "Backgrounds:"; list_backgrounds
    # Check if DEST/background.png exists (pressing enter keeps it)
    [[ -f $DEST/background.png ]] && echo "  (Enter keeps the currently installed one)"
    # Read user input
    read -rp "Choose [1-${#backgrounds[@]}]: " sel
    # Validate the user input
    if [[ -n $sel ]]; then
        [[ $sel =~ ^[0-9]+$ && $sel -ge 1 && $sel -le ${#backgrounds[@]} ]] || die "invalid choice"
        pick=${backgrounds[$((sel-1))]}
    fi
fi
# Fallback background image: first image in the backgrounds array
[[ -n $pick || -f $DEST/background.png ]] || pick=${backgrounds[0]}

# --------------------------------
# Installing the theme files
# --------------------------------
info "installing to $DEST"
install -d "$DEST" "$DEST/assets"
install -m 644 "$SRC/theme.txt" "$DEST/theme.txt"
install -m 644 "$SRC"/assets/*.png "$DEST/assets/"
install -m 644 "$SRC"/fonts/*.pf2 "$DEST/"

# Choosing and installing the background image
if [[ -n $pick ]]; then
    info "background: $(basename "$pick")"
    # Extract extension and make all chars lowercase
    ext=${pick##*.}; ext=${ext,,}
    # Remove old background image
    rm -f "$DEST"/background.{png,jpg,jpeg,tga}
    # NOTE: GRUB decodes images in firmware-era memory (no interlace support)
    # Normalise to 1920x1080, 8-bit, non-interlaced PNG (also makes the menu appear faster)
    im=$(command -v magick || command -v convert || true)
    if [[ -n $im && $RESIZE -eq 1 ]]; then
        # If magick or convert is available and RESIZE is set..
        info "re-encoding background to 1920x1080 8-bit PNG ($(basename "$im"))"
        "$im" "$pick" -resize 1920x1080^ -gravity center -extent 1920x1080 -depth 8 -interlace none PNG24:"$DEST/background.png"
        ext=png
    else
        install -m 644 "$pick" "$DEST/background.$ext"
    fi
    # Update theme.txt when necessary
    if [[ $ext != png ]]; then
        sed -i "s#^desktop-image:.*#desktop-image: \"background.$ext\"#" "$DEST/theme.txt"
    fi
fi

# Respect `--no-config` flag/option
[[ $CONFIG -eq 1 ]] || { info "done (--no-config): theme files copied"; exit 0; }

# --------------------------------
# Backing up and editin /etc/default/grub
# --------------------------------
THEME_PATH="$DEST/theme.txt"
backup=$DEFAULTS.bak.$(date +%Y%m%d-%H%M%S)
cp -a "$DEFAULTS" "$backup"
info "backed up $DEFAULTS -> $backup"

# ---------------------------------------------
# set_var KEY VALUE
# 3 possibilities:
#   * Variable is already active
#   * Variable exists, but is commented out
#   * Variable just doesn't exist at all
# ---------------------------------------------
set_var() {
    local key=$1 val=$2 line="$1=\"$2\""
    # Variable already active
    if grep -qE "^${key}=" "$DEFAULTS"; then
        sed -i -E "s|^${key}=.*|${line}|" "$DEFAULTS"

    # Variable exists, but is commented out
    elif grep -qE "^#\s*${key}=" "$DEFAULTS"; then
        sed -i -E "0,/^#\s*${key}=.*/s||${line}|" "$DEFAULTS"

    # Varaible doesn't exist at all (append)
    else
        printf '\n%s\n' "$line" >> "$DEFAULTS"
    fi
}

set_var GRUB_THEME "$THEME_PATH"
set_var GRUB_GFXMODE "1920x1080,auto"
set_var GRUB_GFXPAYLOAD_LINUX "keep"

# NOTE: Disabling forced text-mode output
# (a theme is silently ignored when the console is forced to text mode)
# Script checks for either of these:
#   * GRUB_TERMINAL=console
#   * GRUB_TERMINAL_OUTPUT=console
if grep -qE '^GRUB_TERMINAL(_OUTPUT)?=.*console' "$DEFAULTS"; then
    sed -i -E 's/^(GRUB_TERMINAL(_OUTPUT)?=.*)$/# \1  # disabled by dark-souls-grub (breaks themes)/' "$DEFAULTS"
    info "disabled GRUB_TERMINAL*=console in $DEFAULTS"
fi

# --------------------------------
# Regenerate
# --------------------------------
# Detect the command
if command -v grub-mkconfig >/dev/null; then
    MKCONFIG=grub-mkconfig;
else
    MKCONFIG=grub2-mkconfig;
fi

info "$MKCONFIG -o $GRUB_DIR/grub.cfg"
"$MKCONFIG" -o "$GRUB_DIR/grub.cfg"

grep -q "set theme=" "$GRUB_DIR/grub.cfg" && info "theme is active in grub.cfg" \
    || echo "warning: grub.cfg contains no 'set theme=' line - check the output above" >&2

info "done. Reboot to see it."
