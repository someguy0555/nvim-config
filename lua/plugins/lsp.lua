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
            'giuxtaposition/blink-cmp-copilot',
        },
        version = '1.*',
        opts = {
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
                    draw = { columns = { { "kind_icon", "kind", gap = 1 }, { "label", "label_description", gap = 1 }, } },
                },
            },
            -- snippets = { preset = 'luasnip' },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
                providers = {
                    copilot = {
                        name = "copilot",
                        module = "blink-cmp-copilot",
                        score_offset = 100,
                        async = true,
                    },
                },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
            -- fuzzy = { implementation = "lua" },
        },
        opts_extend = { "sources.default" },
    },
}
