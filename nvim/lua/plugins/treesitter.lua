return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		ts.setup({})

		-- No-op for parsers already installed; installs missing ones async
		ts.install({
			"c",
			"cpp",
			"rust",
			"go",
			"python",
			"css",
			"javascript",
			"typescript",
			"tsx",
			"astro",
			"html",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"markdown",
			"markdown_inline",
		})

		-- `main` no longer auto-enables highlighting; start it per filetype
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("ts_start", { clear = true }),
			callback = function(args)
				local lang = vim.treesitter.language.get_lang(args.match)
				if lang then
					pcall(vim.treesitter.start, args.buf, lang)
				end
			end,
		})

		-- NOTE: Incremental selection (feature from old master branch, rebuilt)
		local stack = {}

		local function node_range(n)
			local sr, sc, er, ec = n:range()
			if ec == 0 and er > sr then
				er = er - 1
				ec = #vim.api.nvim_buf_get_lines(0, er, er + 1, false)[1]
			end
			return sr, sc, er, ec
		end

		local function select_node(n)
			local sr, sc, er, ec = node_range(n)
			vim.cmd("normal! \27")
			vim.api.nvim_win_set_cursor(0, { sr + 1, sc })
			vim.cmd("normal! v")
			vim.api.nvim_win_set_cursor(0, { er + 1, math.max(ec - 1, 0) })
		end

		-- Current visual selection as 0-based (sr, sc, er, ec), ec exclusive
		local function visual_range()
			local a, b = vim.fn.getpos("v"), vim.fn.getpos(".")
			local sr, sc, er, ec = a[2] - 1, a[3] - 1, b[2] - 1, b[3] - 1
			if sr > er or (sr == er and sc > ec) then
				sr, sc, er, ec = er, ec, sr, sc
			end
			local line = vim.api.nvim_buf_get_lines(0, er, er + 1, false)[1] or ""
			if ec < #line then
				ec = ec + 1 + vim.str_utf_end(line, ec + 1)
			end
			return sr, sc, er, ec
		end

		local function same(n, sr, sc, er, ec)
			local a, b, c, d = node_range(n)
			return a == sr and b == sc and c == er and d == ec
		end

		local function covers_larger(n, sr, sc, er, ec)
			local a, b, c, d = n:range()
			local covers = (a < sr or (a == sr and b <= sc)) and (c > er or (c == er and d >= ec))
			return covers and not (a == sr and b == sc and c == er and d == ec)
		end

		local function init_selection()
			local ok, node = pcall(vim.treesitter.get_node)
			if not ok or not node then
				return
			end
			stack = { node }
			select_node(node)
		end

		local function node_incremental()
			local sr, sc, er, ec = visual_range()
			local top = stack[#stack]
			if not (top and same(top, sr, sc, er, ec)) then
				-- Selection was changed by hand: rebuild from the tree
				local ok, parser = pcall(vim.treesitter.get_parser)
				if not ok or not parser then
					return
				end
				parser:parse()
				local node = parser:named_node_for_range({ sr, sc, er, ec })
				if not node then
					return
				end
				stack = { node }
				top = node
			end
			local n = top
			while n and not covers_larger(n, sr, sc, er, ec) do
				n = n:parent()
			end
			if n then
				table.insert(stack, n)
				select_node(n)
			end
		end

		local function node_decremental()
			if #stack > 1 then
				table.remove(stack)
				select_node(stack[#stack])
			end
		end

		vim.keymap.set("n", "<C-space>", init_selection, { desc = "TS: start selection" })
		vim.keymap.set("x", "<C-space>", node_incremental, { desc = "TS: grow selection" })
		vim.keymap.set("x", "<BS>", node_decremental, { desc = "TS: shrink selection" })
	end,
}
