-- lua/plugins/formatting.lua
return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            -- Вместо black и isort используем ruff
            -- "ruff_fix" - исправит импорты и ошибки (аналог isort)
            -- "ruff_format" - отформатирует код (аналог black)

            python = { "ruff_fix", "ruff_format" },
            lua = { "stylua" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,

        },
    },
}
