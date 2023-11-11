return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        css = { "prettierd" },
        sass = { "prettierd" },
        html = { "prettierd" },
        json = { "fixjson" },
        nix = { "alejandra" },
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },
    })

    local keymap = vim.keymap.set

    keymap({ "n", "v" }, "<leader>cf", function()
      conform.format({
        lsp_fallback = true,
        async = true,
        timeout_ms = 500,
      })
    end)
  end,
}
