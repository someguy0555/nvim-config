return {
    -- Command and arguments to start the server.
    cmd = { 'lua-language-server' },

    -- Filetypes to automatically attach to.
    filetypes = { 'lua' },

    -- Sets the "root directory" to the parent directory of the file in the
    -- current buffer that contains either a ".luarc.json" or a
    -- ".luarc.jsonc" file. Files that share a root directory will reuse
    -- the connection to the same LSP server.
    root_markers = { '.luarc.json', '.luarc.jsonc' },

    -- Specific settings to send to the server. The schema for this is
    -- defined by the server. For example the schema for lua-language-server
    -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    'vim',
                    'require'
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
                -- function()
                --     for _, str in pairs(vim.api.nvim_get_runtime_file("", true)) do print(str) end
                -- end
            },
        },
    },
}
-- for _, str in ipairs(vim.api.nvim_get_runtime_file("", true)) do
--     print(str)
-- end

-- return {
--     -- Command and arguments to start the server.
--     cmd = { 'lua-language-server' },
--
--     -- Filetypes to automatically attach to.
--     filetypes = { 'lua' },
--
--     -- Sets the "root directory" to the parent directory of the file in the
--     -- current buffer that contains either a ".luarc.json" or a
--     -- ".luarc.jsonc" file. Files that share a root directory will reuse
--     -- the connection to the same LSP server.
--     root_markers = { '.luarc.json', '.luarc.jsonc' },
--
--     -- Specific settings to send to the server. The schema for this is
--     -- defined by the server. For example the schema for lua-language-server
--     -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
--     settings = {
--         Lua = {
--             runtime = {
--                 -- Tell the language server which version of Lua you're using
--                 -- (most likely LuaJIT in the case of Neovim)
--                 version = 'LuaJIT',
--             },
--             diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = {
--                     'vim',
--                     'require'
--                 },
--             },
--             workspace = {
--                 -- Make the server aware of Neovim runtime files
--                 library = vim.api.nvim_get_runtime_file("", true),
--             },
--             -- Do not send telemetry data containing a randomized but unique identifier
--             telemetry = {
--                 enable = false,
--             },
--         },
--     },
-- }

-- return {
--   on_init = function(client)
--     local path = client.workspace_folders[1].name
--     if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
--       return
--     end
--
--     client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
--       runtime = {
--         -- Tell the language server which version of Lua you're using
--         -- (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT'
--       },
--       -- Make the server aware of Neovim runtime files
--       workspace = {
--         checkThirdParty = false,
--         library = {
--           vim.env.VIMRUNTIME
--           -- Depending on the usage, you might want to add additional paths here.
--           "${3rd}/luv/library"
--           "${3rd}/busted/library",
--         }
--         -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
--         -- library = vim.api.nvim_get_runtime_file("", true)
--       }
--     })
--   end,
--   settings = {
--     Lua = {}
--   }
-- }
