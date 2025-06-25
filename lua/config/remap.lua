-- Center on screen
vim.keymap.set("n", "<C-d>", "<C-d>zz", {silent = true})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {silent = true})
vim.keymap.set("n", "gg", "ggzz", {silent = true})
vim.keymap.set("n", "G", "Gzz", {silent = true})
vim.keymap.set("n", "<C-o>", "<C-o>zz", {silent = true})
vim.keymap.set("n", "<C-i>", "<C-i>zz", {silent = true})

-- Keep shift visual line mode after shift. 
vim.keymap.set("v", ">", ">gv", {silent = true})
vim.keymap.set("v", "<", "<gv", {silent = true})

