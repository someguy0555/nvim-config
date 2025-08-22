return {
    {
        'ibhagwan/fzf-lua',
        opts = {},
        config = function()
            local fzf = require('fzf-lua')
            fzf.setup({
                keymap = {
                    builtin = {
                        ["<C-u>"] = "preview-page-up",
                        ["<C-d>"] = "preview-page-down",
                    },
                    fzf = {
                        ["ctrl-a"] = "toggle-all",
                        ["ctrl-s"] = "toggle",
                    }
                },
                actions = {
                    files = {
                        ["enter"]  = fzf.actions.file_edit_or_qf,
                        ["ctrl-q"] = fzf.actions.file_sel_to_qf,
                        ["ctrl-Q"] = fzf.actions.file_sel_to_ll,
                        ["ctrl-i"] = fzf.actions.toggle_ignore,
                        ["ctrl-h"] = fzf.actions.toggle_hidden,
                        ["ctrl-f"] = fzf.actions.toggle_follow,
                        ["ctrl-x"] = { fn = fzf.actions.git_reset, reload = true },
                        ["ctrl-t"] = { fn = fzf.actions.git_stage_unstage, reload = true },
                    },
                },
            })
            vim.keymap.set('n', '<leader>fl', fzf.files)
            vim.keymap.set('n', '<leader>fg', fzf.live_grep)
            vim.keymap.set('n', '<leader>fh', fzf.help_tags)

            vim.keymap.set('n', '<leader>fq', fzf.quickfix)
            vim.keymap.set('n', '<leader>fQ', fzf.loclist)

            -- vim.keymap.set('n', '<leader>fd', fzf.git_diff)
            vim.keymap.set('n', '<leader>fs', fzf.git_status)
            vim.keymap.set('n', '<leader>fb', fzf.git_branches)

            vim.keymap.set('n', '<leader>lw', fzf.lsp_workspace_symbols)

            vim.keymap.set('n', '<leader>ft', fzf.colorschemes)
        end
    },
}
