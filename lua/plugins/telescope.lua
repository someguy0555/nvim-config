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
						},
						n = {
							["<j>"] = require("telescope.actions").move_selection_next,
							["<k>"] = require("telescope.actions").move_selection_previous,
						},
					},
				},
			})
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
			vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope live grep' })
			vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
			vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope help tags' })
			vim.keymap.set('n', '<leader>t', builtin.colorscheme)

			-- LSP
			vim.keymap.set('n', '<leader>lw', builtin.lsp_dynamic_workspace_symbols)

			-- require("telescope").load_extension("undo")
			-- vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
		end,
	},
}
