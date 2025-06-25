return {
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                undercurl = true,
                underline = true,
                bold = true,
                invert_selection = true,
                contrast = "soft", -- Example: Customize the color scheme
                transparent_mode = true,
            })
            vim.cmd.colorscheme("gruvbox")
        end,
    },
    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     config = function()
    --         require("rose-pine").setup({
    --             variant = "moon", -- auto, main, moon, or dawn
    --             dark_variant = "moon", -- main, moon, or dawn
    --
    --             styles = {
    --                 bold = true,
    --                 italic = true,
    --                 transparency = true,
    --             },
    --
    --             highlight_groups = {
    --                 Visual = {fg = "#ffc0cb" },
    --                 VisualNOS = {fg = "#ffc0cb" },
    --                 Search = {fg = "#ffc0cb" },
    --                 IncSearch = {fg = "#ffc0cb" },
    --                 CursorLine = {fg = "#ffc0cb" },
    --             },
    --         })
    --         vim.cmd.colorscheme("rose-pine")
    --     end
    -- },
    { "nvim-tree/nvim-web-devicons", opts = {} },
}
