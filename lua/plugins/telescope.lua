return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep',
            -- 'sharkdp/fd',
            -- "debugloop/telescope-undo.nvim",
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    border = false,
                    mappings = {
                        i = {
                            ["<C-j>"] = require("telescope.actions").move_selection_next,
                            ["<C-k>"] = require("telescope.actions").move_selection_previous,
                            ["<C-q>"] = require("telescope.actions").send_to_qflist,
                            ["<C-l>"] = require("telescope.actions").send_to_loclist,
                        },
                        n = {
                            ["<j>"] = require("telescope.actions").move_selection_next,
                            ["<k>"] = require("telescope.actions").move_selection_previous,
                            ["<C-q>"] = require("telescope.actions").send_to_qflist,
                            ["<C-l>"] = require("telescope.actions").send_to_loclist,
                        },
                    },
                },
            })
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>fl', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
            vim.keymap.set('n', '<leader>ft', builtin.colorscheme)
            -- LSP
            vim.keymap.set('n', '<leader>lw', builtin.lsp_dynamic_workspace_symbols)

            -- require("telescope").load_extension("undo")
            -- vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
        end,
    },
}
