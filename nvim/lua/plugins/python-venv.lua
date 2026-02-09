-- lua/plugins/python-venv.lua
return {
    "linux-cultist/venv-selector.nvim",

    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-telescope/telescope.nvim",

        "nvim-lua/plenary.nvim",
    },
    lazy = false,
    -- branch = "regexp", -- <--- ЭТУ СТРОКУ МЫ УДАЛИЛИ

    opts = {
        settings = {
            options = {
                notify_user_on_venv_activation = true,
            },
        },
    },

    keys = {

        { "<leader>v", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
    },
}
