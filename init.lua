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
vim.o.grepprg = "rg --vimgrep"
vim.o.grepformat = "%f:%l:%c:%m"

local map = vim.keymap.set
-- Map
map('n', '<leader>o', ':update<CR>:source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
map({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')
map('n', '<leader><leader>', ':nohlsearch<CR>')
map('n', '<leader>di', function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end)
map('n', '<leader>dq', vim.diagnostic.setqflist)
map('n', '<leader>dl', vim.diagnostic.setloclist)
map('n', '<leader>lq', ':copen<CR>')
map('n', '<leader>ll', ':lopen<CR>')
map('n', '<leader>lf', vim.lsp.buf.format)
map("n", "<leader>ln", vim.lsp.buf.rename)
map('n', '<leader>ld', vim.lsp.buf.definition)
map('n', '<leader>li', vim.lsp.buf.implementation)
map('n', '<leader>lr', vim.lsp.buf.references)
map('n', '<leader>la', vim.lsp.buf.code_action)
map('n', '<leader>lh', vim.lsp.buf.hover)
map('n', '<leader>lt', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end)
map('n', '<C-k>', ':wincmd k<CR>')
map('n', '<C-j>', ':wincmd j<CR>')
map('n', '<C-h>', ':wincmd h<CR>')
map('n', '<C-l>', ':wincmd l<CR>')
map('n', '<C-w>t', ':tabnew <CR>')
map('t', '<C-n>', '<C-\\><C-n>')

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
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
    },
})

Custom = {}
Custom.attached_lsps = {}
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        -- vim.print("Attach!")
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client == nil then return end
        for _, lsp in ipairs(Custom.attached_lsps) do
            if lsp == client then return end
        end
        table.insert(Custom.attached_lsps, client)
    end
})
vim.api.nvim_create_autocmd('LspDetach', {
    callback = function(args)
        -- vim.print("Detach!")
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then return end
        for index, lsp in ipairs(Custom.attached_lsps) do
            if lsp == client then
                table.remove(Custom.attached_lsps, index)
                return
            end
        end
    end,
})
function Custom.get_attached_lsps()
    local lsp_strs = {}
    for index, lsp in ipairs(Custom.attached_lsps) do
        lsp_strs[index] = lsp.name
        -- Attach additional info:
        -- ...
    end
    if #lsp_strs > 0 then return '{ ' .. table.concat(lsp_strs, ', ') .. ' }' end
    return ''
end
function Custom.get_cursor_rows_columns_and_percentage_of_screen_scrolled()
    local cur = vim.api.nvim_win_get_cursor(0)
    local row, col = cur[1], cur[2]
    return tostring(row) ..
        ', ' .. tostring(col) .. '    ' .. tostring(math.floor(row / vim.api.nvim_buf_line_count(0) * 100)) .. '%'
end
function Custom.statusline()
    local parts = {
        -- [[%< %{luaeval("vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(vim.api.nvim_get_current_win()))")} %=]],
        [[%< %{luaeval("vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(vim.api.nvim_get_current_win())) .. '    ' .. Custom.get_attached_lsps()")} %=]],
        [[%< %{luaeval("Custom.get_cursor_rows_columns_and_percentage_of_screen_scrolled() .. '    '")}]],
    }
    return table.concat(parts)
end
vim.o.statusline = '%!v:lua.Custom.statusline()'

vim.api.nvim_create_autocmd('Filetype', {
    pattern = { 'c', 'cpp', 'h', 'hpp' },
    callback = function()
        vim.bo.commentstring = '//%s'
    end,
    group = comment_augroup
})

-- vim.api.nvim_create_autocmd("LspAttach", {
--     group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--     callback = function(args)
--         local client = vim.lsp.get_client_by_id(args.data.client_id)
--         if client == nil then return end
--         if client.server_capabilities.inlayHintProvider then
--             vim.lsp.inlay_hint.enable(true)
--         end
--         -- whatever other lsp config you want
--     end
-- })
--
-- vim.lsp.buf.inlay_hint(0, true)
-- vim.lsp.inlay_hint.enable(true)
vim.lsp.enable({ 'lua_ls', 'clangd', 'omnisharp', 'hls' })

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

-- vim.cmd('colorscheme quiet')

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
