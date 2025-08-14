-- Setting usable shell
-- vim.o.shell="powershell.exe"
-- vim.o.shellcmdflag="-command"
-- vim.o.shellquote="\""
-- vim.o.shellxquote="" 

-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Filetypes and syntax
vim.cmd("filetype on")
vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")
vim.o.cp = false
vim.cmd("syntax on")

-- Tab configuration
vim.opt.smarttab = true           -- Makes tab insertion smarter (auto-indentation)
vim.opt.shiftwidth = 4            -- Number of spaces for each indentation level
vim.opt.expandtab = true          -- Use spaces instead of tabs
vim.opt.tabstop = 8               -- Number of spaces that a tab character represents
vim.opt.softtabstop = 8
-- vim.cmd([[
--   autocmd FileType * setlocal smarttab expandtab shiftwidth=4 tabstop=4 softtabstop=4
-- ]])

-- Set up cache directories
local cache = vim.fn.expand(".temp/nvim")
if vim.fn.isdirectory(cache) == 0 then
  vim.fn.mkdir(cache, "p")
end

-- Backup settings
vim.opt.backup = true
vim.opt.writebackup = true
vim.opt.backupdir = {cache .. "//"}    -- '//' ensures unique filenames
vim.opt.backupskip = {}               -- no default skip; everything is backed by default

-- Swap and undo (optional)
vim.opt.directory = {cache .. "//"}   -- swap files go here
vim.opt.undodir = {cache .. "//"}     -- persistent undo files
vim.opt.undofile = true

-- Misc
vim.opt.incsearch = true
vim.opt.wrap = false

-- Appearance
vim.o.winborder = "single"

-- NO. FUCKING. SHADA!!
-- vim.opt.shadafile = "NONE"

vim.api.nvim_create_autocmd('Filetype', {
    pattern = {'c', 'cpp', 'h', 'hpp'},  -- Add all relevant patterns
    callback = function()
        vim.bo.commentstring = '//%s'
    end,
    group = comment_augroup
})

-- Swap
vim.opt.swapfile = false

-- vim.api.nvim_create_user_command('Pbuff', 'e "C:\\Users\\msjon\\.pbuff.md"', {})
