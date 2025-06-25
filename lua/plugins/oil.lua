return {
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
        config = function()
            require("oil").setup({
                columns = {
                    "icon",
                    -- "permissions",
                    "size",
                    "mtime",
                },
                win_options = {
                    wrap = false,
                    signcolumn = "no",
                    cursorcolumn = false,
                    foldcolumn = "0",
                    spell = false,
                    list = false,
                    conceallevel = 1,
                    concealcursor = "nvic",
                },

                skip_confirm_for_simple_edits = true,
                delete_to_trash = true,

                keymaps = {
                    ["g?"] = { "actions.show_help", mode = "n" },
                    ["<CR>"] = "actions.select",
                    ["<C-s>"] = { "actions.select", opts = { vertical = true } },
                    -- ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
                    -- ["<C-t>"] = { "actions.select", opts = { tab = true } },
                    ["<C-p>"] = "actions.preview",
                    ["<C-c>"] = { "actions.close", mode = "n" },
                    -- ["<C-l>"] = "actions.refresh",
                    ["<C-t>"] = "actions.refresh",
                    ["-"] = { "actions.parent", mode = "n" },
                    ["_"] = { "actions.open_cwd", mode = "n" },
                    ["`"] = { "actions.cd", mode = "n" },
                    ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
                    ["gs"] = { "actions.change_sort", mode = "n" },
                    ["gx"] = "actions.open_external",
                    ["g."] = { "actions.toggle_hidden", mode = "n" },
                    ["g\\"] = { "actions.toggle_trash", mode = "n" },
                    ['yp'] = {
                        desc = 'Copy filepath to system clipboard',
                        callback = function ()
                            require('oil.actions').copy_entry_path.callback()
                            vim.fn.setreg("+", vim.fn.getreg(vim.v.register))
                        end,
                    },
                },
                  -- Set to false to disable all of the above keymaps
                use_default_keymaps = false,

                view_options = {
                    show_hidden = true,
                },
                preview_split = "right",
            })
            vim.keymap.set('n', '<C-t>', ':Oil<CR>', {silent = true})
            vim.keymap.set('n', '-', ':Oil<CR>', {silent = true})
        end,
    },
}
