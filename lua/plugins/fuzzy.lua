return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep',
            -- Undo tree
            "debugloop/telescope-undo.nvim",
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    border = false,
                    mappings = {
                        i = {
                            ["<C-c>"] = require("telescope.actions").close,  -- Close in insert mode
                            ["<C-j>"] = require("telescope.actions").move_selection_next,
                            ["<C-k>"] = require("telescope.actions").move_selection_previous,
                        },
                        n = {
                            ["<j>"] = require("telescope.actions").move_selection_next,
                            ["<k>"] = require("telescope.actions").move_selection_previous,
                            ["q"] = require("telescope.actions").close,    -- Close with 'q' in normal mode
                        },
                    },
                },
                -- Telescope-undo
                undo = {
                },
            })
            -- Plugin-specific mappings
            vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>", { desc = "Find Files" })
            vim.keymap.set("n", "<leader>g", ":Telescope live_grep<CR>", { desc = "Live Grep" })
            vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>", { desc = "Live Grep" })
            -- vim.keymap.set("n", "<leader>h", ":Telescope help_tags<CR>", { desc = "Live Grep" })

            -- Telescope-undo
            require("telescope").load_extension("undo")
            vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
        end,
    },
    -- {
    --     'ThePrimeagen/harpoon',
    --     config = function ()
    --         vim.keymap.set("n", "<C-m>", ":lua require(\"harpoon.ui\").toggle_quick_menu()<CR>", { silent = true })
    --         vim.keymap.set("n", "<leader>m", ":lua require(\"harpoon.mark\").add_file()<CR>", {})
    --     end
    -- },
}
