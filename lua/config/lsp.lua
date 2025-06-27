local lsps = { -- Don't forget to add config in "./lsp/<server_name>.lua"!
    "luals",
    "clangd",
    -- "haskellls",
    -- "pyright",
}
for _, lsp in pairs(lsps) do
    local setup = {}
    vim.lsp.enable(lsp)
end
