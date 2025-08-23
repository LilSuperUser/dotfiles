return {
	"williamboman/mason.nvim",
	lazy = false,

	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"neovim/nvim-lspconfig",
		"folke/neodev.nvim",
	},

	config = function()
		require("neodev").setup()

		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			automatic_enable = false,
			ensure_installed = {
				"lua_ls",
				"basedpyright",
				"gopls",
				"eslint",
				"marksman",
				"jsonls",
				"html",
				"cssls",
				"tailwindcss",
				"biome",
				"emmet_language_server",
				"clangd",
				"rust_analyzer",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"pylint",
				"clangd",
				"denols",
				"black",
				"clang-format",
				"cpplint",
				"codelldb",
			},
		})
	end,
}
