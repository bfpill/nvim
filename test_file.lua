vim.cmd [[
set nocompatible
syntax enable
filetype plugin indent on
]]

vim.opt.runtimepath:append(vim.fn.stdpath('config')..'/colors')

vim.cmd('colorscheme bruin')
