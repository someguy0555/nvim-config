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

-- Map
vim.keymap.set('n', '<C-c>', '<Esc>')
vim.keymap.set('n', '<leader>o', ':update<CR>:source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<C-z>', ':quit!<CR>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', '"+d')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>p', '"+p')
vim.keymap.set('n', '<leader><leader>', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>di', function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end)
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setqflist)
vim.keymap.set('n', '<leader>dQ', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>lq', ':copen<CR>')
vim.keymap.set('n', '<leader>lQ', ':lopen<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation)
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references)
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>lt', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end)
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-w>t', ':tabnew %<CR>')
vim.keymap.set('n', '<C-w>c', ':tabclose <CR>')
vim.keymap.set('t', '<C-n>', '<C-\\><C-n>')

-- Workspaces
vim.keymap.set('n', '<leader>a1', 'mA')
vim.keymap.set('n', '<leader>a2', 'mB')
vim.keymap.set('n', '<leader>a3', 'mC')
vim.keymap.set('n', '<leader>a4', 'mD')
vim.keymap.set('n', '<leader>a5', 'mE')
vim.keymap.set('n', '<leader>a6', 'mF')
vim.keymap.set('n', '<leader>a7', 'mG')
vim.keymap.set('n', '<leader>a8', 'mH')
vim.keymap.set('n', '<leader>a9', 'mI')
vim.keymap.set('n', '<leader>a0', 'mJ')
vim.keymap.set('n', '<leader>1', '`A')
vim.keymap.set('n', '<leader>2', '`B')
vim.keymap.set('n', '<leader>3', '`C')
vim.keymap.set('n', '<leader>4', '`D')
vim.keymap.set('n', '<leader>5', '`E')
vim.keymap.set('n', '<leader>6', '`F')
vim.keymap.set('n', '<leader>7', '`G')
vim.keymap.set('n', '<leader>8', '`H')
vim.keymap.set('n', '<leader>9', '`I')
vim.keymap.set('n', '<leader>0', '`J')

-- Remap
vim.keymap.set('n', '<C-d>', '<C-d>zz', { silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { silent = true })
vim.keymap.set('v', '<', '<gv', { silent = true })
vim.keymap.set('v', '>', '>gv', { silent = true })

vim.diagnostic.config({
    virtual_text = { prefix = "●", source = "if_many", },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = { border = "rounded", },
})

vim.lsp.enable({ 'lua_ls', 'clangd', 'omnisharp', 'hls', 'markdown_oxide' , 'pyright' })

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
    defaults = { version = '*', },
    spec = { { import = "plugins" }, },
    ui = { border = "single", },
    install = { colorscheme = { "gruvbox" } },
    checker = { notify = false, enabled = false, },
})
-- vim.cmd('colorscheme quiet')

---Show attached LSP clients in `[name1, name2]` format.
---Long server names will be modified. For example, `lua-language-server` will be shorten to `lua-ls`
---Returns an empty string if there aren't any attached LSP clients.
---@return string
local function lsp_status()
    local attached_clients = vim.lsp.get_clients({ bufnr = 0 })
    if #attached_clients == 0 then
        return ""
    end
    local names = vim.iter(attached_clients)
        :map(function(client)
            local name = client.name:gsub("language.server", "ls")
            return name
        end)
        :totable()
    return "{ " .. table.concat(names, ", ") .. " }"
end
local function get_cur_pos_percentage()
    local cur = vim.api.nvim_win_get_cursor(0)
    local row = cur[1]
    return tostring(math.floor(row / vim.api.nvim_buf_line_count(0) * 100)) .. '%'
end
function _G.statusline()
    return table.concat({
        "%f",
        "%h%w%m%r",
        lsp_status(),
        "%=",
        " %-14(%l,%c%V%)",
        -- "%P    ",
        get_cur_pos_percentage() .. '%',
        "    ",
    }, "   ")
end
vim.o.statusline = "%{%v:lua._G.statusline()%}"

vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("HelpReplaceWindow", { clear = true }),
    callback = function()
        if vim.bo.filetype == "help" and vim.b.already_opened == nil then
            -- remember we already opened this buffer
            vim.b.already_opened = true

            -- close the original window
            local original_win = vim.fn.win_getid(vim.fn.winnr('#'))
            local help_win = vim.api.nvim_get_current_win()
            if original_win ~= help_win then
                vim.api.nvim_win_close(original_win, false)
            end
            vim.bo.buflisted = true
        end
    end,
})

vim.api.nvim_create_autocmd('Filetype', {
    pattern = { 'c', 'cpp', 'h', 'hpp' },
    callback = function() vim.bo.commentstring = '//%s' end,
    group = comment_augroup
})

function NoInterruptions()
    vim.cmd('set signcolumn=no')
    vim.cmd('set norelativenumber')
    vim.cmd('set nonumber')
    vim.cmd('set laststatus=4')
    vim.cmd('set laststatus=0')
    vim.cmd('set statusline=""')
    vim.cmd('set cmdheight=0')
end

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
