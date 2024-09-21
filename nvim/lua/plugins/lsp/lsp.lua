return {
    {
        name = "nvim-lspconfig",
        dir = "@nvim_lspconfig@",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            -- LSP for Neovim config
            { name = "neodev.nvim", dir = "@neodev_nvim@", opts = {} },
            -- JSON/YAML schema
            { name = "schemastore.nvim", dir = "@schemastore_nvim@" },
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            ----------------------
            -- General settings --
            ----------------------

            -- LSP
            local server_list = require("plugins.lsp.server-list")
            for _, server in ipairs(server_list) do
                lspconfig[server].setup({})
            end

            ----------------------------------------
            -- Specific settings for some servers --
            ----------------------------------------

            -- JSON
            lspconfig.jsonls.setup({
                -- Enable code snippets
                -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls
                capabilities = capabilities,
                settings = {
                    json = {
                        schemas = require("schemastore").json.schemas(),
                        validate = { enable = true },
                    },
                },
            })

            -- YAML
            lspconfig.yamlls.setup({
                settings = {
                    yaml = {
                        schemaStore = {
                            -- You must disable built-in schemaStore support if you want to use
                            -- this plugin and its advanced options like `ignore`.
                            enable = false,
                            -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                            url = "",
                        },
                        schemas = require("schemastore").yaml.schemas(),
                    },
                },
            })

            -- Lua
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        -- format = { enable = false },
                    },
                },
            })
        end,
    },
}