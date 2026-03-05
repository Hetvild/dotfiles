-- lua/plugins/terminal.lua
return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20, -- Высота терминала (если открывать снизу)
        open_mapping = [[<c-\>]], -- Горячая клавиша: Ctrl + \ (обратный слеш)

        hide_numbers = true, -- Скрыть номера строк в терминале
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true, -- Сразу переходить в режим ввода
        insert_mappings = true, -- Использовать наши маппинги (см. ниже)
        persist_size = true,
        direction = "float", -- Режимы: 'vertical' | 'horizontal' | 'tab' | 'float'
        close_on_exit = true, -- Закрывать окно, когда процесс завершается
        shell = vim.o.shell, -- Использовать системный шелл (zsh/bash/fish)
        float_opts = {
          border = "curved", -- Закругленная рамка
          winblend = 0,
        },
      })

      -- ОЧЕНЬ ВАЖНО: Настройка навигации внутри терминала
      function _G.set_terminal_keymaps()
        local opts = {buffer = 0}
        -- Выход из режима терминала в режим "Normal" по Esc или jk
        vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts) -- Ваша привычка jk
        
        -- Навигация между окнами (если терминал не плавающий, а разделенный)

        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)

        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      end

      -- Применять настройки только когда открывается терминал

      vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end
  }
}
