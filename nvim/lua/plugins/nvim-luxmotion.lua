return {
	"LuxVim/nvim-luxmotion",
	config = function()
		require("luxmotion").setup({
			cursor = {
				duration = 250,
				easing = "ease-out",
				enabled = true,
			},
			scroll = {
				duration = 400,
				easing = "ease-out",
				enabled = true,
			},
			performance = { enabled = false },
			keymaps = {
				cursor = true,
				scroll = true,
			},
		})
	end,
}
