return {
	"uga-rosa/ccc.nvim",
	event = "VeryLazy",
	config = function()
		local ccc = require("ccc")
		local mapping = ccc.mapping

		ccc.setup({
			preserve = true,
			save_on_quit = true,
			alpha_show = "auto",
			bar_char = "█",
			point_char = "●",
			empty_point_bg = false,

			inputs = {
				ccc.input.rgb,
				ccc.input.hsl,
				ccc.input.hwb,
				ccc.input.cmyk,
				ccc.input.oklab,
				ccc.input.hex,
			},

			outputs = {
				ccc.output.hex,
				ccc.output.hex_short,
				ccc.output.css_rgb,
				ccc.output.css_rgba,
				ccc.output.css_hsl,
				ccc.output.css_hwb,
				ccc.output.css_oklab,
			},

			pickers = {
				ccc.picker.hex,
				ccc.picker.hex_long,
				ccc.picker.hex_short,
				ccc.picker.css_rgb,
				ccc.picker.css_hsl,
				ccc.picker.css_hwb,
				ccc.picker.css_lab,
				ccc.picker.css_lch,
				ccc.picker.css_oklab,
				ccc.picker.css_oklch,
				ccc.picker.css_name,
				ccc.picker.defaults,
			},

			highlighter = {
				auto_enable = true,
				lsp = true,
				max_byte = 200 * 1024,
			},

			mappings = {
				["<CR>"] = mapping.complete,
				q = mapping.quit,
				i = mapping.cycle_input_mode,
				o = mapping.cycle_output_mode,
				a = mapping.toggle_alpha,
				g = mapping.toggle_prev_colors,

				["$"] = mapping.set100,

				l = mapping.increase1,
				h = mapping.decrease1,

				L = mapping.increase10,
				H = mapping.decrease10,
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<C-c>", "<CMD>CccPick<CR>", { desc = "Open color picker" })
		vim.keymap.set("n", "<A-c>", "<CMD>CccConvert<CR>", { desc = "Convert color format" })
		vim.keymap.set("n", "<Leader>cc", "<CMD>CccHighlighterToggle<CR>", { desc = "Toggle ccc highlighter" })
	end,
}
