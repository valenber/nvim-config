local opt = vim.opt

opt.wrap = true
opt.swapfile = false
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.clipboard = "unnamedplus" -- share system clipboard
opt.cursorline = true

-- use spaces for tabs etc
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true
opt.hlsearch = true
--
-- keep undo history across sessions
opt.undofile = true

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
opt.completeopt = "menuone,noselect"

-- remove search highlight when moving cursor
local keymap = vim.keymap.set
local options = { noremap = true }

-- remove search highlight
keymap("n", "<Esc>", ":noh<CR>", options)

-- highlight yanked text
vim.api.nvim_set_hl(0, "YankHighlight", { fg = "#171f40", bg = "#bfa95b" })
vim.cmd([[
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="YankHighlight", timeout=400})
  augroup END
]])
