-- lua/plugins/lsp.lua
return {
    -- 1. Mason (Оставляем для ruff, lua_ls и других утилит)
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        opts = {}
    },

    -- 2. LSP Config
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",

        },
        config = function()
            local lspconfig = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- АВТОМАТИКА (Mason):
            -- Настраиваем то, что Mason умеет ставить сам (Ruff, Lua)
            mason_lspconfig.setup({
                -- УБИРАЕМ "pyright", так как теперь у нас есть "ty"
                ensure_installed = { "ruff", "lua_ls" },
                handlers = {
                    function(server_name)
                        lspconfig[server_name].setup({
                            capabilities = capabilities,

                        })
                    end,

                    -- Настройка Ruff (Линтер / Форматтер)
                    ["ruff"] = function()
                        lspconfig.ruff.setup({
                            capabilities = capabilities,
                            on_attach = function(client)
                                -- Отключаем hover от Ruff, чтобы не конфликтовал с ty
                                client.server_capabilities.hoverProvider = false
                            end,
                        })
                    end,

                    -- Настройка Lua
                    ["lua_ls"] = function()
                        lspconfig.lua_ls.setup({
                            capabilities = capabilities,
                            settings = {

                                Lua = {
                                    diagnostics = { globals = { "vim" } },
                                },
                            },
                        })
                    end,
                }
            })

            -- РУЧНАЯ НАСТРОЙКА (Ty):
            -- Для Neovim 0.11+ (согласно документации Astral)
            -- Мы добавляем это ВНЕ handlers Mason, так как Mason не управляет ty.


            -- 1. Настраиваем конфиг (если нужно передать специфичные настройки)
            vim.lsp.config('ty', {

                capabilities = capabilities, -- Передаем возможности cmp для автодополнения
                settings = {
                    ty = {
                        -- Сюда можно добавить настройки, если они появятся в документации
                        -- analysis = { ... }
                    }
                }
            })

            -- 2. Включаем LSP для ty
            -- Эта команда сама запустит сервер, когда вы откроете python файл
            vim.lsp.enable('ty')
        end
    },

    -- 3. Autocompletion (Оставляем без изменений)
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {

                    expand = function(args) luasnip.lsp_expand(args.body) end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },

                    { name = "buffer" },
                    { name = "path" },

                }),

            })
        end,

    },

}
