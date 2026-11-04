---------------------------------
------ HYPRLAND CONFIG ----------
---------------------------------

require("modules.environment") -- Environment varaibles
require("modules.looknfeel") -- Look and Feel
require("modules.animations") -- Animations
require("modules.keybinds") -- Programs and Keybinds
require("modules.input") -- Input & Gestures
require("modules.windowrules") -- Window and Layer rules

---------------------------------
----------- Monitors ------------
---------------------------------
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "1",
})

---------------------------------
---------- Autostart ------------
---------------------------------
hl.on("hyprland.start", function()
	hl.exec_cmd("swww-daemon")
	hl.exec_cmd("wayle panel start")
	hl.exec_cmd("blueman-applet")
	hl.exec_cmd("wl-paste --type text --watch cliphist store") -- text data
	hl.exec_cmd("wl-paste --type image --watch cliphist store") -- image data
end)
