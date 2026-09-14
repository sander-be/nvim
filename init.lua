vim.g.mapleader = " "
vim.g.maplocalleader = "//"

vim.keymap.set("n", "<leader>s", "<Cmd>so ~/.config/nvim/init.lua<CR>")

require("config.options")
