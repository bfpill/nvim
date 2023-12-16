vim.keymap.set('n', '<Del>', '<Del>', { noremap = true })
vim.keymap.set('i', '<Del>', '<Del>', { noremap = true })
vim.keymap.set('v', '<Del>', '<Del>', { noremap = true })


vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter", "WinEnter"}, {
    pattern = "*",
    callback = function()
        vim.keymap.set('n', '<Del>', '<Del>', { noremap = false })
        vim.keymap.set('i', '<Del>', '<Del>', { noremap = false })
        vim.keymap.set('v', '<Del>', '<Del>', { noremap = false })
    end,
})


vim.defer_fn(function()
    vim.keymap.set({'n', 'i', 'v'}, '<Del>', '<Del>', { noremap = false })
end, 1000) -- Adjust the delay as needed
