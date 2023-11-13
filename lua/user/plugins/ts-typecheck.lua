return {
  "dmmulroy/tsc.nvim",
  cmd = { "TSC" },
  config = function()
    local tsc = require("tsc")

    tsc.setup()
  end,
}
