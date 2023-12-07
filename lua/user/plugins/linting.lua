return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      css = { "stylelint" },
      scss = { "stylelint" },
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      json = { "jsonlint" },
      lua = { "luacheck" },
      markdown = { "markdownlint" },
      nix = { "nix" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", {
      clear = true,
    })

    vim.api.nvim_create_autocmd({
      "BufEnter",
      "BufWritePost",
      "InsertLeave",
      "TextChanged",
    }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
