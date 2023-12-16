require("bfpill")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd[[ hi Comment cterm=italic ]]
vim.cmd[[colorscheme blackboard]]

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = false

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
vim.api.nvim_exec([[
  autocmd VimEnter * cd ~/Desktop/wrap/Code/
]], false)
