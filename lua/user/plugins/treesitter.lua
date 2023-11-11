return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  -- event = { "BufReadPre", "BufNewFile" }, -- disabled this because lazy loading was breaking the neotest
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "go",
        "http",
        "javascript",
        "jsdoc",
        "lua",
        "markdown",
        "markdown_inline",
        "mermaid",
        "nix",
        "regex",
        "scss",
        "sql",
        "tsx",
        "typescript",
        "vim",
      },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      auto_install = true,

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
