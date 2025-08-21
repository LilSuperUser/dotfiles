return {

	{ "echasnovski/mini.nvim", version = false },

	-- MiniFiles file explorer
	{
		"echasnovski/mini.files",
		config = function()
			local MiniFiles = require("mini.files")
			MiniFiles.setup({
				mappings = {
					close = "q",
					go_in = "<CR>",
					go_out = "-",
					reveal_cwd = "@",
				},
				options = {
					permanent_delete = false,
					use_as_default_explorer = false,
				},
			})

			-- Keymaps for minifiles
			vim.keymap.set("n", "<leader>e", "<CMD>lua MiniFiles.open()<CR>", { desc = "Open MiniFiles explorer" })
			vim.keymap.set("n", "<leader>E", function()
				MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
				MiniFiles.reveal_cwd()
			end, { desc = "Open MiniFiles explorer into currently opened file" })
		end,
	},

	-- MiniComment for comments
	{
		"echasnovski/mini.comment",
		version = false,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			-- disable the autocommand from ts-context-commentstring
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
			require("mini.comment").setup({
				-- tsx, jsx, html , svelte comment support
				options = {
					custom_commentstring = function()
						return require("ts_context_commentstring.internal").calculate_commentstring({
							key = "commentstring",
						}) or vim.bo.commentstring
					end,
				},
			})
		end,
	},

	-- Surround
	{
		"echasnovski/mini.surround",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- Add custom surroundings to be used on top of builtin ones. For more
			-- information with examples, see `:h MiniSurround.config`.
			custom_surroundings = nil,

			-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
			highlight_duration = 300,

			-- Module mappings. Use `''` (empty string) to disable one.
			-- INFO:
			-- saiw surround with no whitespace
			-- saw surround with whitespace
			mappings = {
				add = "sa", -- Add surrounding in Normal and Visual modes
				delete = "ds", -- Delete surrounding
				find = "sf", -- Find surrounding (to the right)
				find_left = "sF", -- Find surrounding (to the left)
				highlight = "sh", -- Highlight surrounding
				replace = "sr", -- Replace surrounding
				update_n_lines = "sn", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
			-- Number of lines within which surrounding is searched
			n_lines = 30,
			-- Whether to respect selection type:
			-- - Place surroundings on separate lines in linewise mode.
			-- - Place surroundings on each line in blockwise mode.
			respect_selection_typew = false,
			-- How to search for surrounding (first inside current line, then inside
			-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
			-- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
			-- see `:h MiniSurround.config`.
			search_method = "cover",
			-- Whether to disable showing non-error feedback
			silent = false,
		},
	},

	-- Mini Trailspace
	{
		"echasnovski/mini.trailspace",
		event = "VeryLazy",
		config = function()
			local MiniTrailSpace = require("mini.trailspace")

			MiniTrailSpace.setup({
				only_in_normal_buffers = true,
			})

			-- Keymap to manually trim whitespace from the file
			vim.keymap.set("n", "<leader>ts", function()
				-- The `trim()` function also removes the highlight after cleaning
				MiniTrailSpace.trim()
				print("Trailing whitespace trimmed.")
			end, { desc = "[T]rim Trail[s]pace" })

			-- Keymap to manually clear the highlight without trimming
			vim.keymap.set("n", "<leader>tc", function()
				MiniTrailSpace.unhighlight()
				print("Trailing whitespace highlight cleared.")
			end, { desc = "[T]rim [C]lear Highlight" })

			-- Autocommand to automatically clear the highlight when in insert mode
			vim.api.nvim_create_autocmd("InsertEnter", {
				pattern = "*",
				callback = function()
					MiniTrailSpace.unhighlight()
				end,
				desc = "Clear trailing whitespace highlight on entering insert mode.",
			})
		end,
	},
}
