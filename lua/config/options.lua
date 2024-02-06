-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.conceallevel = 0
vim.opt.title = true
vim.opt.titlelen = 0

if vim.g.neovide then
  vim.o.guifont = "FiraCode Nerd Font:h12"
end
