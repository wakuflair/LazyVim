-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = true
vim.opt.conceallevel = 0
vim.opt.title = true
vim.opt.titlelen = 0

vim.opt.scrolloff = 20

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono NF:h11"
end

if vim.fn.has("win32") == 1 then
  -- Check if 'pwsh' is executable and set the shell accordingly
  if vim.fn.executable("pwsh") == 1 then
    vim.o.shell = "pwsh"
  else
    vim.o.shell = "powershell"
  end

  -- Setting shell command flags
  vim.o.shellcmdflag =
    "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"

  -- Setting shell redirection
  vim.o.shellredir = '2>&1 | %{ "$_" } | Out-File %s; exit $LastExitCode'

  -- Setting shell pipe
  vim.o.shellpipe = '2>&1 | %{ "$_" } | Tee-Object %s; exit $LastExitCode'

  -- Setting shell quote options
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end
