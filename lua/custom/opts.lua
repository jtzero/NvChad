--local opt = vim.opt
--opt.clipboard = "unnamedplus"


vim.cmd('set runtimepath+=~/.vim,~/.vim/after')
vim.cmd('set packpath+=~/.vim')

vim.cmd('source ~/.vimrc-post-init-lua')

