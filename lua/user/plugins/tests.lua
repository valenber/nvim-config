return {
  {
    "haydenmeade/neotest-jest",
  },
  {
    "nvim-neotest/neotest",
    dependencies = { "haydenmeade/neotest-jest" },
    config = function()
      local neotest = require("neotest")
      local keymap = vim.keymap.set

      neotest.setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function()
              return vim.fn.getcwd()
            end,
          }),
        },
      })

      keymap("n", "<leader>tt", "<cmd>lua require('neotest').run.run()<cr>")
      keymap("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>")
      keymap("n", "<leader>tw", "<cmd>lua require('neotest').summary.toggle()<cr>")
    end,
  },
}
