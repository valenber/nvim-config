return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local builtin = require("telescope.builtin")

      local keymap = vim.keymap.set

      telescope.setup({
        defaults = {
          path_display = { "truncate " },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous, -- move to prev result
              ["<C-j>"] = actions.move_selection_next, -- move to next result
            },
          },
        },
      })

      telescope.load_extension("fzf")

      keymap("n", "<Leader>ff", builtin.find_files)
      keymap("n", "<Leader>sg", builtin.live_grep)
      keymap("n", "<Leader>sh", builtin.help_tags)
      keymap("n", "<Leader>s*", builtin.grep_string)
      keymap("n", "gr", builtin.lsp_references)
    end,
  },
}
