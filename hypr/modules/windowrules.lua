----------------------------------
------ WINDOW & LAYER RULES ------
----------------------------------

--------------------
-- NOTE: Window Rules
--------------------

-- PulseAudio Volume Control
hl.window_rule({
	name = "pavucontrol",
	match = { class = "^org\\.pulseaudio\\.pavucontrol$" },

	float = true,
	center = true,
	size = "600 500",
})

-- Waypaper
hl.window_rule({
	name = "waypaper",
	match = { class = "^waypaper$" },

	float = true,
	center = true,
	size = "800 500",
})

-- Network Manager Editor
hl.window_rule({
	name = "nm-connection-editor",
	match = { class = "^nm-connection-editor$" },

	float = true,
	center = true,
})

-- Zen Browser
hl.window_rule({
	name = "zen-no-blur",
	match = { class = "^zen$" },

	no_blur = true,
	opaque = true,
})

-- Gwenview
hl.window_rule({
	name = "gwenview-no-blur",
	match = { class = "^org\\.kde\\.gwenview$" },

	no_blur = true,
	opaque = true,
})

-- VLC
hl.window_rule({
	name = "vlc-no-blur",
	match = { class = "^vlc$" },

	no_blur = true,
	opaque = true,
})

-- Obsidian
hl.window_rule({
	name = "obsidian-no-blur",
	match = { class = "^md\\.Obsidian$" },

	no_blur = true,
	opaque = true,
})

-- Blueman Manager
hl.window_rule({
	name = "blueman-manager",
	match = { class = "^blueman-manager$" },

	float = true,
	center = true,
	size = "700 600",
})

-- OKLCH Color Picker
hl.window_rule({
	name = "oklch-color-picker",
	match = { class = "^OKLCH Color Picker$" },

	float = true,
	size = "800 500",
	move = "1100 70",
})

-- Kleopatra
hl.window_rule({
	name = "kleopatra",
	match = { initial_title = "^Notepad — Kleopatra$" },

	float = true,
	center = true,
	size = "800 800",
})

-- Kitty
hl.window_rule({
	name = "kitty-opacity",
	match = { class = "^kitty$" },

	opacity = "0.85 0.85",
})

-- Fix dragging issues with XWayland blank windows
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

--------------------
-- NOTE: Layer Rules
--------------------

-- Wofi blur
hl.layer_rule({
	name = "wofi-blur",
	match = { namespace = "^wofi$" },

	blur = true,
	ignore_alpha = 0.5,
})

-- Dim everything behind a launcher layer
hl.layer_rule({
	name = "launcher-dim-around",
	match = { namespace = "^launcher$" },

	dim_around = true,
})
