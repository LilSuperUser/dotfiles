------------------------------
---------- INPUT -------------
------------------------------

hl.config({
	input = {
		-- Keyboard
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		numlock_by_default = false,
		repeat_delay = 300,
		repeat_rate = 50,

		-- Mouse focus
		follow_mouse = 1,
		mouse_refocus = true,
		focus_on_close = 2,

		follow_mouse_shrink = 3,
		follow_mouse_threshold = 0.0,

		-- Mouse acceleration
		accel_profile = "adaptive",
		sensitivity = 0.0,
		force_no_accel = false,

		-- Scrolling
		natural_scroll = false,
		scroll_factor = 1.0,
		emulate_discrete_scroll = 1,

		-- Touchpad
		touchpad = {
			natural_scroll = false,
			scroll_factor = 1.0,

			disable_while_typing = true,
			middle_button_emulation = false,

			clickfinger_behavior = false,
			tap_to_click = true,
			tap_and_drag = true,
			tap_button_map = "lrm",
		},
	},
})

-- NOTE: Per-Device Configs (Empty for now)

-- NOTE: Gestures
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down", mods = "ALT", action = "close" })
hl.gesture({ fingers = 3, direction = "up", mods = "ALT", scale = 1.5, action = "fullscreen" })
