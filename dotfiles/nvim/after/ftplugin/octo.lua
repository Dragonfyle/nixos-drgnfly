-- Enables autocompletion for @username and #issue
vim.keymap.set("i", "@", "@<C-x><C-o>", { buffer = true })
vim.keymap.set("i", "#", "#<C-x><C-o>", { buffer = true })

