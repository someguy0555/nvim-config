vim.g.mapleader = " "

local opt = vim.o

opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.wrap = false
opt.swapfile = false
opt.undofile = true
opt.winborder = "rounded"
opt.signcolumn = "yes"
opt.incsearch = true
opt.ignorecase = true
opt.smartindent = true

local map = vim.keymap.set

map('n', '<leader>o', ':update<CR>:source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map('n', '<leader>lf', vim.lsp.buf.format)
map('n', '<leader><leader>', ':nohlsearch<CR>')

map('i', '<C-k>', ':nohlsearch<CR>')
map('i', '<C-j>', ':nohlsearch<CR>')

vim.pack.add({
	{ src = 'https://github.com/ellisonleao/gruvbox.nvim' },
	{ src = 'https://github.com/stevearc/oil.nvim' },
	{ src = 'https://github.com/nvim-lua/plenary.nvim' },
	{ src = 'https://github.com/nvim-telescope/telescope.nvim' },
	{ src = 'https://github.com/mason-org/mason.nvim' },
	-- { src = 'https://github.com/neovim/nvim-lspconfig'},
})


require("mason").setup()
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = require("telescope.actions").move_selection_next,
				["<C-j>"] = require("telescope.actions").move_selection_prev,
			}
		}
	},
})
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

require("oil").setup()

vim.lsp.enable({ 'lua_ls' })

vim.cmd("colorscheme gruvbox")
-- vim.o.colorscheme = "gruvbox"
-- vim.cmd(":hi statusline guibg=NONE")
