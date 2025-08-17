return {
    "norcalli/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup({
            filetypes = {"*"},
            user_default_options = {
                RGB      = true,   -- #RGB hex codes
                RRGGBB   = true,   -- #RRGGBB hex codes
                names    = true,   -- "Name" codes like Blue
                RRGGBBAA = true,   -- #RRGGBBAA hex codes
                rgb_fn   = true,   -- CSS rgb() and rgba() functions
                hsl_fn   = true,   -- CSS hsl() and hsla() functions
                css      = true,   -- Enable all CSS features
                css_fn   = true,   -- Enable all CSS *functions*
                mode     = 'background', -- Set the display mode.
            },
        })

        vim.api.nvim_create_autocmd("BufEnter", {
            pattern = "*",
            callback = function()
                vim.cmd("ColorizerAttachToBuffer")
            end,
            desc = "Attach Colorizer to buffer"
        })

        vim.keymap.set("n", "<leader>cp", "<CMD>ColorizerAttachToBuffer<CR>", { desc="Attach colorizer to buffer" })
    end,
}
