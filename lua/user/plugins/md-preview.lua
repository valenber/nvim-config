return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  config = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.cmd([[
      let g:mkdp_theme = 'dark'
      let g:mkdp_auto_close = 0
      let g:mkdp_combine_preview = 1
    ]])
  end,
  ft = { "markdown" },
}
