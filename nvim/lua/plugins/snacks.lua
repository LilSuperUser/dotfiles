return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,

		opts = {},

        keys = {
			-- For LazyGit & Git
			{
				"<leader>lg",
				function()
					require("snacks").lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>gl",
				function()
					require("snacks").lazygit.log()
				end,
				desc = "Lazygit Logs",
			},
			{
				"<leader>gd",
				function()
					require("snacks").picker.git_diff()
				end,
				desc = "Git diff (hunks)",
			},

			-- To Rename the current file
			{
				"<leader>R",
				function()
					require("snacks").rename.rename_file()
				end,
				desc = "Fast Rename Current File",
			},
			-- To close the current buffer (if the file is not saved, asks to save)
			{
				"<leader>dB",
				function()
					require("snacks").bufdelete()
				end,
				desc = "Close Buffer  (Confirm)",
			},

			-- For snack pickers (finders and shit)
			{
				"<leader>pf",
				function()
					require("snacks").picker.files()
				end,
				desc = "Find files (snacks picker)",
			},
			{
				"<leader>pc",
				function()
					require("snacks").picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find nvim config files",
			},
			{
				"<leader>pw",
				function()
					require("snacks").picker.grep()
				end,
				desc = "Grep something",
			},
			{
				"<leader>pvs",
				function()
					require("snacks").picker.grep_word()
				end,
				desc = "Grep a visual selection (word or anything)",
				mode = { "n", "x" },
			},
			{
				"<leader>pk",
				function()
					require("snacks").picker.keymaps({ layout = "default" })
				end,
				desc = "Search keymaps",
			},
			{
				"<leader>p'",
				function()
					require("snacks").picker.registers()
				end,
				desc = "Search registers",
			},
			{
				"<leader>pm",
				function()
					require("snacks").picker.man({ layout = "vscode" })
				end,
				desc = "Search man pages",
			},
			-- Pick color schemes
			{
				"<leader>th",
				function()
					require("snacks").picker.colorschemes({ layout = "ivy" })
				end,
				desc = "Pick Color Schemes",
			},
			-- View help pages
			{
				"<leader>vh",
				function()
					require("snacks").picker.help()
				end,
				desc = "Help Pages",
			},
			-- Pick and switch betwen git branches
			{
				"<leader>gbr",
				function()
					require("snacks").picker.git_branches({ layout = "select" })
				end,
				desc = "Pick & witch git branches",
			},
			-- For indents
			{
				"<leader>io",
				function()
					require("snacks").indent.enable()
				end,
				desc = "Enable indentaion lines",
			},
			{
				"<leader>ic",
				function()
					require("snacks").indent.disable()
				end,
				desc = "Disable indentation lines",
			},
		},
	},
}
