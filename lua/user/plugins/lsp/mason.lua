return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      PATH = "append", -- this makes Mason use system binaries for language servers
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    vim.lsp.set_log_level("off") -- disable logging

    mason_lspconfig.setup({
      ensure_installed = { "lua_ls", "tsserver", "cssls", "html", "emmet_ls" },
      automatic_installation = true,
    })

    -- keymaps
    local keymap = vim.keymap.set

    keymap("n", "<Leader>cd", vim.diagnostic.open_float)
    keymap("n", "K", vim.lsp.buf.hover)
    keymap("n", "<Leader>cn", vim.lsp.buf.rename)
    keymap("n", "<Leader>ca", vim.lsp.buf.code_action)
  end,
}
