-- lua/config/lazy.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",

        "clone",
        "--filter=blob:none",

        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    -- ВОТ ЭТОТ БЛОК НУЖНО ИСПРАВИТЬ:

    checker = {
        enabled = true, -- Проверять обновления (можно оставить)
        notify = false, -- <--- ГЛАВНОЕ: Отключить всплывающее окно
    },
    change_detection = {
        notify = false, -- Тоже отключить уведомления об изменении конфигов
    },
})
