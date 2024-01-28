require("bfpill")

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Set the number of spaces per tab (e.g., 4 spaces)
vim.opt.shiftwidth = 4


-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd[[ hi Comment cterm=italic ]]
vim.cmd[[colorscheme blackboard]]

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = false

-- empty setup using defaults
require("nvim-tree").setup()

