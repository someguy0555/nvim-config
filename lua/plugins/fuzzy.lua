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
        vim.keymap.set("n", "<leader>h", ":Telescope help_tags<CR>", { desc = "Live Grep" })

        -- Telescope-undo
        require("telescope").load_extension("undo")
        vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
    end,
},
-- {
--     "nvim-telescope/telescope-file-browser.nvim",
--     dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
--
--     config = function()
--         local fb_actions = require "telescope".extensions.file_browser.actions
--         -- You don't need to set any of these options.
--         -- IMPORTANT!: this is only a showcase of how you can set default options!
--         require("telescope").setup {
--           extensions = {
--             file_browser = {
--               -- theme = "ivy",
--               -- disables netrw and use telescope-file-browser in its place
--               hijack_netrw = true,
--               mappings = {
--                 ["i"] = {
--                   -- your custom insert mode mappings
--                   ["<C-r>"] = fb_actions.rename,
--                   ["<C-m>"] = fb_actions.move,
--                   ["<C-y>"] = fb_actions.copy,
--                   ["<C-d>"] = fb_actions.remove
--
--                   -- end,
--                 },
--                 ["n"] = {
--                   -- your custom normal mode mappings
--                 },
--               },
--             },
--           },
--         }
--         -- To get telescope-file-browser loaded and working with telescope,
--         -- you need to call load_extension, somewhere after setup function:
--         require("telescope").load_extension "file_browser"
--     end,
-- },
}
