local function safe_require(module)
    local success, result = pcall(require, module)
    if not success then
        -- Optionally log the error to a file if you want to review it later
        -- vim.fn.writefile({tostring(result)}, vim.fn.expand('~/.config/nvim/error.log'), 'a')
        return nil
    end
    return result
end

local function setup_config()
    safe_require("bfpill")

    -- Use spaces instead of tabs
    vim.opt.expandtab = true

    -- Set the number of spaces per tab (e.g., 4 spaces)
    vim.opt.shiftwidth = 4

    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.cmd[[ hi Comment cterm=italic ]]
    vim.cmd[[colorscheme bruin]]

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = false


    vim.opt.colorcolumn = ""
    -- empty setup using defaults
    local nvim_tree = safe_require("nvim-tree")
    if nvim_tree then
        nvim_tree.setup()
    end
end

-- Wrap the entire configuration in pcall
local success, error_msg = pcall(setup_config)
if not success then
    -- Optionally log the error to a file if you want to review it later
    -- vim.fn.writefile({tostring(error_msg)}, vim.fn.expand('~/.config/nvim/error.log'), 'a')
end
