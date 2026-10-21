return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile", "BufReadPost" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters = {
				clang_format = {
					-- Formatting workflow:
					--   • If a project has a .clang-format, use it.
					--   • Otherwise, fall back to ~/.clang-format (my/yoru personal defaults).
					-- NOTE: The formatter's cwd is set to the buffer's directory so style lookup
					-- always starts from the file being formatted : D
					cwd = function(_, ctx)
						return ctx.dirname
					end,
					prepend_args = {
						"--style=file",
						-- Used only if .clang-format is NOT FOUND ANYWHERE!
						"--fallback-style=LLVM",
					},
				},
				["markdown-toc"] = {
					condition = function(_, ctx)
						for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
							if line:find("<!%-%- toc %-%->") then
								return true
							end
						end
					end,
				},
				["markdownlint-cli2"] = {
					condition = function(_, ctx)
						local diag = vim.tbl_filter(function(d)
							return d.source == "markdownlint"
						end, vim.diagnostic.get(ctx.buf))
						return #diag > 0
					end,
				},
			},
			formatters_by_ft = {
				markdown = { "prettier", "markdown-toc" },
				lua = { "stylua" },
				html = { "prettier" },
				css = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				rust = { "rustfmt" },
				python = { "black" },
				asm = { "asmfmt" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				astro = { "prettier" },
			},
			-- format_on_save = {
			--     lsp_fallback = true,
			--     async = false,
			--     timeout_ms = 1000,
			-- },
		})

		-- Configure individual formatters
		conform.formatters.prettier = {
			args = {
				"--stdin-filepath",
				"$FILENAME",
				"--tab-width",
				"4",
				"--use-tabs",
				"false",
			},
		}

		conform.formatters.shfmt = {
			prepend_args = { "-i", "4" },
		}

		vim.keymap.set({ "n", "v" }, "<leader>mf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format whole file or range (in visual mode) with" })
	end,
}
