-- Disable all error reporting
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.opt.errorbells = false
vim.opt.visualbell = false

-- Function to safely execute any function
local function safe_call(fn, ...)
    local status, error_msg = pcall(fn, ...)
    if not status then
        -- Optionally log errors
        -- vim.fn.writefile({tostring(error_msg)}, vim.fn.expand('~/.config/nvim/error.log'), 'a')
    end
end

-- Safely source a file
local function safe_source(file)
    safe_call(vim.cmd.source, file)
end

-- Safely require a module
local function safe_require(module)
    safe_call(require, module)
end

-- Wrap the entire Neovim startup process
safe_call(function()
    -- Load your real configuration
    safe_source(vim.fn.stdpath('config') .. '/init_real.lua')

    -- Load all plugin files
    local plugin_dir = vim.fn.stdpath('config') .. '/after/plugin'
    if vim.fn.isdirectory(plugin_dir) == 1 then
        local plugin_files = vim.fn.glob(plugin_dir .. '/*.lua', false, true)
        for _, file in ipairs(plugin_files) do
            safe_source(file)
        end
    end
end)

-- Override Neovim's error handling functions
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.fn.echoerr = function() end
        vim.api.nvim_err_writeln = function() end
    end
})
