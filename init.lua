vim.g.mapleader = " "

vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.wrap = false
vim.o.swapfile = false
vim.o.undofile = true
vim.o.winborder = "rounded"
vim.o.signcolumn = "yes"
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartindent = true

local map = vim.keymap.set
-- Map
map('n', '<leader>o', ':update<CR>:source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
map({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')
map('n', '<leader><leader>', ':nohlsearch<CR>')
map('n', '<leader>lf', vim.lsp.buf.format)
map("n", "<leader>lr", vim.lsp.buf.rename)
map('n', '<leader>ld', vim.lsp.buf.definition)
map('n', '<leader>li', vim.lsp.buf.implementation)
map('n', '<leader>ln', vim.lsp.buf.references)
map('n', '<leader>la', vim.lsp.buf.code_action)
map('n', '<leader>lh', vim.lsp.buf.hover)
map('n', '<C-k>', ':wincmd k<CR>', { silent = true })
map('n', '<C-j>', ':wincmd j<CR>', { silent = true })
map('n', '<C-h>', ':wincmd h<CR>', { silent = true })
map('n', '<C-l>', ':wincmd l<CR>', { silent = true })
map('t', '<C-n>', '<C-\\><C-n>')
map("n", "<C-;>", vim.diagnostic.open_float)
-- map("n", "]d", vim.diagnostic.goto_next) -- Already exists
-- map("n", "[d", vim.diagnostic.goto_prev) -- Already exists

-- Remap
map('n', '<C-d>', '<C-d>zz', { silent = true })
map('n', '<C-u>', '<C-u>zz', { silent = true })
map('v', '<', '<gv', { silent = true })
map('v', '>', '>gv', { silent = true })

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    source = "if_many",
  },
  -- signs = {
  --   text = {
  --     [vim.diagnostic.severity.ERROR] = "",
  --     [vim.diagnostic.severity.WARN]  = "",
  --     [vim.diagnostic.severity.HINT]  = "",
  --     [vim.diagnostic.severity.INFO]  = "",
  --   },
  -- },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    -- source = "always",
    border = "rounded",
  },
})

vim.o.signcolumn = "yes"

vim.api.nvim_create_autocmd('Filetype', {
    pattern = { 'c', 'cpp', 'h', 'hpp' },
    callback = function()
        vim.bo.commentstring = '//%s'
    end,
    group = comment_augroup
})

-- vim.lsp.enable({ 'lua_ls', 'clangd' })
vim.lsp.enable({ 'lua_ls', 'clangd', 'omnisharp' })
-- vim.lsp.enable({ 'lua_ls', 'clangd', 'hls' })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)
vim.g.maplocalleader = "\\"

require("lazy").setup({
    defaults = {
        version = '*',
    },
    spec = {
        { import = "plugins" },
    },
    ui = { border = "single", },
    install = { colorscheme = { "gruvbox" } },
    checker = {
        notify = false,
    },
})

-- -- local dap = require("dap")
-- -- local dapui = require("dapui")
-- -- dapui.setup()
-- --
-- -- dap.listeners.before.attach.dapui_config = function()
-- --   dapui.open()
-- -- end
-- -- dap.listeners.before.launch.dapui_config = function()
-- --   dapui.open()
-- -- end
-- -- dap.listeners.before.event_terminated.dapui_config = function()
-- --   dapui.close()
-- -- end
-- -- dap.listeners.before.event_exited.dapui_config = function()
-- --   dapui.close()
-- -- end
-- -- -- vim.keymap.set('n', '<leader>bb', require('dap').toggle_breakpoint)
-- -- vim.keymap.set('n', '<leader>bk', require('dap').continue)
-- -- vim.keymap.set('n', '<leader>bl', require('dap').run_last)
-- --
-- -- dap.adapters["local-lua"] = {
-- --   type = "executable",
-- --   command = "node",
-- --   args = {
-- --     vim.fs.joinpath(vim.fn.stdpath("data"), "mason/share/local-lua-debugger-vscode/extension/debugAdapter.js"),
-- --   },
-- -- }
-- --
-- -- dap.configurations.lua = {
-- --   {
-- --     name = "Launch current file debugging",
-- --     type = 'local-lua',
-- --     request = 'launch',
-- --     cwd = '${workspaceFolder}',
-- --     extensionPath = vim.fs.joinpath(vim.fn.stdpath("data"), "mason/share/local-lua-debugger-vscode/"),
-- --     program = function()
-- --       return {
-- --         lua = "lua",
-- --         file = vim.api.nvim_buf_get_name(0),
-- --       }
-- --     end,
-- --     verbose = true,
-- --     args = {},
-- --   },
-- -- }
--
