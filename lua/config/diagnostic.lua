-- This HAS to be here, otherwise it doesn't work.
vim.diagnostic.config({
    virtual_lines = false,
  -- virtual_text = {
  --   prefix = "●",
  --   source = "if_many",
  -- },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN]  = "",
      [vim.diagnostic.severity.HINT]  = "",
      [vim.diagnostic.severity.INFO]  = "",
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    -- source = "always",
    border = "rounded",
  },
})

vim.o.signcolumn = "yes"
