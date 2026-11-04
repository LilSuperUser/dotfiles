---------------------------------
------ LOOK & FEEL --------------
---------------------------------

hl.config({
	general = {
		layout = "dwindle",

		-- Window spacing
		gaps_in = 6,
		gaps_out = 10,

		-- Borders
		border_size = 2,
		extend_border_grab_area = 20,
		resize_on_border = 1,

		col = {
			-- Silver / graphite
			active_border = {
				colors = { "#969994", "#666B68" },
				angle = 45,
			},
			inactive_border = "#30312F",
		},

		snap = {
			enabled = true,
			border_overlap = false,
			respect_gaps = true,
			monitor_gap = 10,
			window_gap = 10,
		},
	},

	decoration = {
		-- Opacity
		-- active_opacity = 0.85,
		active_opacity = 1.0,
		inactive_opacity = 0.96,
		fullscreen_opacity = 1.0,

		border_part_of_window = true,

		-- Corners
		rounding = 12,
		rounding_power = 2.0,

		-- Dimming
		dim_inactive = true,
		dim_strength = 0.22,
		dim_modal = true,
		dim_around = 0.4,
		dim_special = 0.2,

		-- Background blur
		blur = {
			enabled = true,

			size = 9,
			passes = 3,

			brightness = 0.95,
			contrast = 0.95,
			noise = 0.0,

			ignore_opacity = false,
			new_optimizations = true,
			xray = false,

			vibrancy = 0.10,
			vibrancy_darkness = 0.10,

			popups = true,
			popups_ignorealpha = 0.2,

			input_methods = false,
			input_methods_ignorealpha = 0.2,

			special = false,
			proportional = false,

			variant = "acrylic",

			acrylic = {
				aberration = 0.003,
				bulb = 48.0,
				clarity = 0.78,
				refraction = 3.0,
				tint = "0x10101020",
			},
		},

		-- Window shadows
		shadow = {
			enabled = true,
			color = "0x00000066",
			color_inactive = "0x00000044",
			offset = { 0, 3 },
			range = 15,
			render_power = 3,
			scale = 1.0,
			sharp = false,
		},

		-- Keep disabled for now.
		glow = {
			enabled = false,
		},

		motion_blur = {
			enabled = false,
		},

		wobble = {
			enabled = false,
		},
	},
})
