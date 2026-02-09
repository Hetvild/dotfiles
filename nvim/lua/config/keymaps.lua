vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Сохранение файл
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })

-- Выход из файла
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit file" })

-- Пример: Выход в режим навигации через jk (чтобы не тянуться к Esc)
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
