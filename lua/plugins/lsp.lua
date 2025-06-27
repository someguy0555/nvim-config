return {
    -- {
    --     "neovim/nvim-lspconfig",
    --     config = function()
    --         -- config
    --         local lsps = {
    --             "luals",
    --             "clangd",
    --             "haskellls",
    --             "pyright",
    --         }
    --         for _, lsp in pairs(lsps) do
    --             vim.lsp.enable(lsp)
    --         end
    --     end,
    -- },
    -- {
    --     "mason-org/mason.nvim",
    --     config = function()
    --         -- Mason is required to download LSP servers 
    --         require("mason").setup()
    --
    --         -- Here I enable lsps
    --         vim.lsp.enable('luals')
    --         vim.lsp.enable('clangd')
    --         vim.lsp.enable('haskellls')
    --         vim.lsp.enable('pyright')
    --     end
    -- },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                -- your cmp setup goes here
                snippet = {
                      -- REQUIRED - you must specify a snippet engine
                      expand = function(args)
                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                        vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

                        -- For `mini.snippets` users:
                        -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
                        -- insert({ body = args.body }) -- Insert at cursor
                        -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
                        -- require("cmp.config").set_onetime({ sources = {} })
                      end,
                },
                window = {},
                mapping = cmp.mapping.preset.insert({
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- scroll up
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- scroll down
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                      -- { name = 'vsnip' }, -- For vsnip users.
                      -- { name = 'luasnip' }, -- For luasnip users.
                      -- { name = 'ultisnips' }, -- For ultisnips users.
                      -- { name = 'snippy' }, -- For snippy users.
                    },
                    {
                      { name = 'buffer' },
                    }
                ),
                experimental = {
                    ghost_text = true,
                },
            })
        end,
    }
    -- {
    --     'kevinhwang91/nvim-ufo', -- Implements folding basically.
    --     dependencies = {
    --         'kevinhwang91/promise-async',
    --     },
    --     config = function ()
    --         vim.o.foldcolumn = '1' -- '0' is not bad
    --         vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    --         vim.o.foldlevelstart = 99
    --         vim.o.foldenable = true
    --
    --         -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
    --         vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    --         vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    --
    --         local capabilities = vim.lsp.protocol.make_client_capabilities()
    --         capabilities.textDocument.foldingRange = {
    --             dynamicRegistration = false,
    --             lineFoldingOnly = true
    --         }
    --         local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
    --         for _, ls in ipairs(language_servers) do
    --             require('lspconfig')[ls].setup({
    --                 capabilities = capabilities
    --                 -- you can add other fields for setting up lsp server in this table
    --             })
    --         end
    --         require('ufo').setup()
    --     end,
    -- }
      -- Not all LSP servers add brackets when completing a function.
      -- To better deal with this, LazyVim adds a custom option to cmp,
      -- that you can configure. For example:
      --
      -- ```lua
      -- opts = {
      --   auto_brackets = { "python" }
      -- }
      -- ```
}
