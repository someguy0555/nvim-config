return {
	{
		'stevearc/oil.nvim',
		config = function()
			require("oil").setup({
				columns = {
					"icon",
					"permissions",
					"size",
					"mtime",
				},
				skip_confirm_for_simple_edits = true,
				delete_to_trash = true,
				cleanup_delay_ms = 0,
				keymaps = {
					["<C-t>"] = { "actions.refresh" },
					['<C-p>'] = {
						desc = 'Copy filepath to system clipboard',
						callback = function()
							require('oil.actions').copy_entry_path.callback()
							vim.fn.setreg("+", vim.fn.getreg(vim.v.register))
						end,
					},
					["<C-j>"] = ':wincmd j<CR>',
					["<C-h>"] = ':wincmd h<CR>',
					["<C-l>"] = ':wincmd l<CR>',
					["<C-k>"] = ':wincmd k<CR>',
				},
				use_default_keymaps = true,
				view_options = {
					show_hidden = true,
				},
			})
			vim.keymap.set('n', '-', ':Oil<CR>', { silent = true })
		end,
	},
}
