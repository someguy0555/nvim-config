-- Copy paste behaviour
vim.keymap.set('i', '<C-v>' , '<C-r>*', {silent = true})
vim.keymap.set('v', '<C-c>', '"+y', {silent = true})
vim.keymap.set('v', '<C-v>', '"+p', {silent = true})

-- Inter window navigation
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', {silent = true})
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', {silent = true})
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', {silent = true})
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', {silent = true})

-- Window resizing
-- vim.keymap.set('n', '-', '<C-w>-', {silent = true})
-- vim.keymap.set('n', '_', '<C-w>+', {silent = true})
-- vim.keymap.set('n', '=', '<C-w><', {silent = true})
-- vim.keymap.set('n', '+', '<C-w>>', {silent = true})

-- Remove highlighting 
vim.keymap.set('n', '<Space><Space>', ':nohl <CR>', {silent = true})

-- Terminal mode
vim.keymap.set('n', '<C-n>', ':term<CR>', {silent = true}) -- Opening terminal
vim.keymap.set('t', '<C-n>', '<C-\\><C-n>', {silent = true}) -- Closing terminal mode

-- New tab
vim.keymap.set('n', '<C-b>', ':tabnew<CR>', {silent = true}) -- Execute external command.

-- Lsp
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {desc = "Rename Symbol"})

-- Show diagnostics
vim.keymap.set("n", "<C-k>", function() vim.diagnostic.open_float() end, { desc = "Diagnostic float" })

-- Go to previous/next diagnostic
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

-- Command mode
-- vim.keymap.set('n', ':', ':<C-f>i', { desc = "Open command screen" })
-- vim.keymap.set('n', '!', ':<C-f>i!', {}) -- Execute external command.

-- Personal buffer
vim.keymap.set('n', '<leader>p', ":e C:\\Users\\msjon\\.pbuff.md <CR>", {silent = true})

-- Normal mode
-- vim.keymap.set('n', '<CR>', 'o<Esc>', { silent = true })

-- Tmp
-- vim.keymap.set('n', '<C-h>', '<leader>p:9<CR>0gfG<CR>`', {})
