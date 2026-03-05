local opt = vim.opt

opt.number = true           -- Показывать номера строк
opt.relativenumber = true   -- Относительные номера (удобно для прыжков)

opt.tabstop = 4             -- Ширина таба
opt.shiftwidth = 4          -- Ширина автоотступа
opt.expandtab = true        -- Превращать табы в пробелы
opt.smartindent = true      -- Умный отступ
opt.wrap = false            -- Не переносить длинные строки
opt.ignorecase = true       -- Игнорировать регистр при поиске
opt.smartcase = true        -- ...если нет заглавных букв
opt.cursorline = true       -- Подсветка текущей строки
opt.termguicolors = true    -- Поддержка True Color
opt.scrolloff = 8           -- Оставлять 8 строк сверху/снизу при скролле
opt.clipboard = "unnamedplus" -- Использовать системный буфер обмена
