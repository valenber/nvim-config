return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = "onedark",
      },
      sections = {
        lualine_a = {
          {
            "filename",
          },
        },
        lualine_b = {
          {
            "branch",
            icon = "",
          },
        },
        lualine_c = {
          {
            "diagnostics",
            sources = { "nvim_lsp" },
            symbols = { error = " ", warn = " ", hint = "󰠠 ", info = " " },
          },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
        },
        lualine_y = {
          {
            "filetype",
            colored = true,
          },
        },
        lualine_z = {
          {
            "progress",
          },
        },
      },
    })
  end,
}
