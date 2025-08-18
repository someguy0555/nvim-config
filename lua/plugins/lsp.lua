return {
    {
        'mason-org/mason.nvim',
        opts = {}
    },
    { 'neovim/nvim-lspconfig' },
    {
        'saghen/blink.cmp',
        dependencies = {
            'rafamadriz/friendly-snippets',
        },
        version = '1.*',
        opts = {
            keymap = {
                preset = 'default',
                ['<C-h>'] = { 'hide' },
                ['<C-l>'] = { 'accept', 'fallback' },
                ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
                ['<C-k>'] = { 'select_prev', 'fallback' },
                ['<C-j>'] = { 'select_next', 'fallback' },
                ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
                ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
                ['<Tab>'] = { 'snippet_forward', 'fallback' },
                ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
                ['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' },
            },
            signature = {
                enabled = true,
                trigger = { enabled = false },
                window = {
                    -- show_documentation = false,
                },
            },
            appearance = {
                nerd_font_variant = 'mono'
            },
            completion = {
                accept = {
                    auto_brackets = {
                        enabled = true,
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 0,
                },
                ghost_text = {
                    enabled = true,
                },
                menu = {
                    auto_show = true,
                    draw = { columns = { { "kind_icon", "kind", gap = 1 }, { "label", "label_description", gap = 1 }, {"source_name"} } },
                    -- draw = { columns = { { "kind_icon", "kind", gap = 1 }, { "label", gap = 1 }, } },
                },
            },
            fuzzy = {
                implementation = "prefer_rust_with_warning",
                -- sorts = {
                --     'score',
                --     'sort_text',
                --     'label',
                -- },
            },
            -- snippets = { preset = 'luasnip' },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
        },
        opts_extend = { "sources.default" },
    },
}
