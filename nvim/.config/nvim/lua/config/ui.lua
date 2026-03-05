return {
  -- Тема Tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false, -- Загрузить сразу при старте
    priority = 1000, -- Загрузить раньше остальных
    config = function()

      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  -- Which-key (показывает подсказки при нажатии кнопок - мастхэв для обучения!)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",

    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  }
}
