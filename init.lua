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
-- Map
map('n', '<leader>o', ':update<CR>:source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map('n', '<leader>lf', vim.lsp.buf.format)
map({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
map({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')
map("n", "<leader>lr", vim.lsp.buf.rename)
map('n', '<leader><leader>', ':nohlsearch<CR>')
map('n', '<C-k>', ':wincmd k<CR>', { silent = true })
map('n', '<C-j>', ':wincmd j<CR>', { silent = true })
map('n', '<C-h>', ':wincmd h<CR>', { silent = true })
map('n', '<C-l>', ':wincmd l<CR>', { silent = true })
map("n", "<C-t>", vim.diagnostic.open_float)
map("n", "]g", vim.diagnostic.goto_next)
map("n", "[g", vim.diagnostic.goto_prev)

-- Remap
map('n', '<C-d>', '<C-d>zz', { silent = true })
map('n', '<C-u>', '<C-u>zz', { silent = true })
map('v', '<', '<gv', { silent = true })
map('v', '>', '>gv', { silent = true })

vim.api.nvim_create_autocmd('Filetype', {
	pattern = { 'c', 'cpp', 'h', 'hpp' }, -- Add all relevant patterns
	callback = function()
		vim.bo.commentstring = '//%s'
	end,
	group = comment_augroup
})

vim.lsp.enable({ 'lua_ls' })

-- Plugins
vim.pack.add({
	{ src = 'https://github.com/ellisonleao/gruvbox.nvim' },
	{ src = 'https://github.com/stevearc/oil.nvim' },
	{ src = 'https://github.com/nvim-lua/plenary.nvim' },
	{ src = 'https://github.com/BurntSushi/ripgrep' },
	{ src = 'https://github.com/nvim-telescope/telescope.nvim' },
	{ src = 'https://github.com/mason-org/mason.nvim' },
	{ src = 'https://github.com/Saghen/blink.cmp' },
	-- { src = 'https://github.com/L3MON4D3/LuaSnip' },
})

require("gruvbox").setup({ invert_selecton = true })
vim.cmd("colorscheme gruvbox")
-- vim.cmd(":hi statusline guibg=NONE")

require("mason").setup()
require("telescope").setup({
	defaults = {
		border = true,
		i = {
			-- ["<C-c>"] = require("telescope.actions").close,  -- Close in insert mode
			["<C-j>"] = require("telescope.actions").move_selection_next,
			["<C-k>"] = require("telescope.actions").move_selection_previous,
		},
		n = {
			["<j>"] = require("telescope.actions").move_selection_next,
			["<k>"] = require("telescope.actions").move_selection_previous,
		},
	},
})
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

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
		['yp'] = {
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
	preview_split = "right",
})
map('n', '-', ':Oil<CR>', { silent = true })

require("blink.cmp").setup({
	keymap = {
		preset = 'default',
		['<C-h>'] = { 'hide' },
		['<C-l>'] = { 'accept', 'fallback' },
		['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
		-- ['<C-y>'] = { 'select_and_accept' },
		['<C-k>'] = { 'select_prev', 'fallback' },
		['<C-j>'] = { 'select_next', 'fallback' },
		-- ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
		-- ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
		['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
		['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
		['<Tab>'] = { 'snippet_forward', 'fallback' },
		['<S-Tab>'] = { 'snippet_backward', 'fallback' },
		['<C-e>'] = { 'show_signature', 'hide_signature', 'fallback' },
	},
	signature = {
		enabled = true,
		window = {
			show_documentation = false,
		},
	},
	appearance = {
		nerd_font_variant = 'mono'
	},
	completion = {
		accept = {
			auto_brackets = {
				enabled = false,
			},
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 0,
		},
		ghost_text = {
			enabled = true,
		},
	},
	-- snippets = { preset = 'luasnip' },
	sources = {
		default = { 'lsp', 'path', 'snippets', 'buffer' },
		-- default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
	},
	-- fuzzy = { implementation = "prefer_rust_with_warning" },
	fuzzy = { implementation = "lua" },
})
