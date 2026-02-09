-- lua/config/autocmds.lua

local function activate_venv()
    -- Ищем папку .venv в текущей директории (стандарт uv)
    local cwd = vim.fn.getcwd()
    local venv_path = cwd .. "/.venv"
    local python_bin = venv_path .. "/bin/python"

    -- Если файл python существует
    if vim.fn.executable(python_bin) == 1 then
        -- 1. Устанавливаем переменную окружения VIRTUAL_ENV
        vim.env.VIRTUAL_ENV = venv_path

        -- 2. Добавляем bin в начало системного PATH
        -- Это нужно, чтобы терминал и инструменты запускались из venv
        vim.env.PATH = venv_path .. "/bin:" .. vim.env.PATH

        -- 3. (Опционально) Уведомляем пользователя
        -- print("Activated venv: " .. venv_path)
    end
end

-- Запускаем функцию при входе в Neovim или смене директории
local venv_group = vim.api.nvim_create_augroup("AutoVenv", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
    group = venv_group,
    callback = activate_venv,
})
