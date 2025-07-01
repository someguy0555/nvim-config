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
                contrast = "", -- Example: Customize the color scheme
                transparent_mode = true,
            })
            vim.cmd.colorscheme("gruvbox")
        end,
    },
    { "nvim-tree/nvim-web-devicons", opts = {} },
    {
        'nvim-lualine/lualine.nvim',
        -- dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    always_show_tabline = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 100,
                        tabline = 100,
                        winbar = 100,
                    }
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diff' },
                    lualine_c = {'filename', 'diagnostics'},
                    lualine_x = {'lsp_status' },
                    lualine_y = {'encoding', 'fileformat', 'filetype'},
                    lualine_z = {'progress', 'location'}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {'filename'},
                    lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
        end
    },
    -- {
    --     "VonHeikemen/fine-cmdline.nvim",
    --     dependencies = {
    --         "MunifTanjim/nui.nvim",
    --     },
    --     config = function()
    --         vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
    --     end
    -- },
}
