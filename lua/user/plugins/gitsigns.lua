return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  config = function()
    local gitsigns = require("gitsigns")
    local keymap = vim.keymap.set

    gitsigns.setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        keymap("n", "<leader>gh", require("gitsigns").preview_hunk, { buffer = bufnr, desc = "Preview git hunk" })
      end,
    })
  end,
}
