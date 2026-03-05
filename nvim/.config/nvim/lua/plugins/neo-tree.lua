-- lua/plugins/editor.lua
return {
  {

    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",

    dependencies = {

      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- нужны иконки (Nerd Fonts)
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true, -- Закрыть Neo-tree, если это последнее окно
        window = {
          width = 30, -- Ширина окна
        },
        filesystem = {
          follow_current_file = {
            enabled = true, -- Следовать за открытым файлом
          },
          filtered_items = {
            visible = true, -- Показывать скрытые файлы (по желанию)
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
      })
    end,
    -- Настраиваем горячую клавишу здесь же
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle Explorer" },

    },
  }
}
