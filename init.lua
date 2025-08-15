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
map('t', '<C-n>', '<C-\\><C-n>')
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
	-- { src = 'https://github.com/xero/evangelion.nvim' },
	{ src = 'https://github.com/stevearc/oil.nvim' },
	{ src = 'https://github.com/nvim-lua/plenary.nvim' },
	{ src = 'https://github.com/BurntSushi/ripgrep' },
	-- { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
	{ src = 'https://github.com/nvim-telescope/telescope.nvim' },
	{ src = 'https://github.com/mason-org/mason.nvim' },
	-- { src = 'https://github.com/L3MON4D3/LuaSnip' },
	{ src = 'https://github.com/Saghen/blink.cmp' },
	-- { src = 'https://github.com/nvim-neotest/nvim-nio' },
	-- { src = 'https://github.com/mfussenegger/nvim-dap' },
	-- { src = 'https://github.com/rcarriga/nvim-dap-ui' },
	-- { src = 'https://github.com/Weissle/persistent-breakpoints.nvim' },
})

require("gruvbox").setup({ invert_selecton = true })
vim.cmd("colorscheme gruvbox")
-- require("evangelion").setup()
-- vim.cmd("colorscheme evangelion")
-- vim.cmd(":hi statusline guibg=NONE")

require("mason").setup()
require("telescope").setup({
	defaults = {
		border = true,
		-- previewer = true,
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

-- local dap = require("dap")
-- local dapui = require("dapui")
-- dapui.setup()
--
-- dap.listeners.before.attach.dapui_config = function()
--   dapui.open()
-- end
-- dap.listeners.before.launch.dapui_config = function()
--   dapui.open()
-- end
-- dap.listeners.before.event_terminated.dapui_config = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited.dapui_config = function()
--   dapui.close()
-- end
-- -- vim.keymap.set('n', '<leader>bb', require('dap').toggle_breakpoint)
-- vim.keymap.set('n', '<leader>bk', require('dap').continue)
-- vim.keymap.set('n', '<leader>bl', require('dap').run_last)
--
-- dap.adapters["local-lua"] = {
--   type = "executable",
--   command = "node",
--   args = {
--     vim.fs.joinpath(vim.fn.stdpath("data"), "mason/share/local-lua-debugger-vscode/extension/debugAdapter.js"),
--   },
-- }
--
-- dap.configurations.lua = {
--   {
--     name = "Launch current file debugging",
--     type = 'local-lua',
--     request = 'launch',
--     cwd = '${workspaceFolder}',
--     extensionPath = vim.fs.joinpath(vim.fn.stdpath("data"), "mason/share/local-lua-debugger-vscode/"),
--     program = function()
--       return {
--         lua = "lua",
--         file = vim.api.nvim_buf_get_name(0),
--       }
--     end,
--     verbose = true,
--     args = {},
--   },
-- }
