return {
	{
		name = "nvim-lspconfig",
		dir = "@nvim_lspconfig@",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			-- LSP for Neovim config
			{ name = "neodev.nvim",      dir = "@neodev_nvim@",     opts = {} },
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
		keys = {
			{
				"<leader>lK",
				'<cmd>lua vim.lsp.buf.hover()<CR>',
				desc = "Hover",
			},
			{
				"<leader>lf",
				'<cmd>lua vim.lsp.buf.formatting()<CR>',
				desc = "Format",
			},
			{
				"<leader>lr",
				'<cmd>lua vim.lsp.buf.references()<CR>',
				desc = "References",
			},
			{
				"<leader>ld",
				'<cmd>lua vim.lsp.buf.definition()<CR>',
				desc = "Definition",
			},
			{
				"<leader>lD",
				'<cmd>lua vim.lsp.buf.declaration()<CR>',
				desc = "Declaration",
			},
			{
				"<leader>li",
				'<cmd>lua vim.lsp.buf.implementation()<CR>',
				desc = "Implementation",
			},
			{
				"<leader>ls",
				'<cmd>lua vim.lsp.buf.signature_help()<CR>',
				desc = "Signature Help",
			},
			{
				"<leader>lt",
				'<cmd>lua vim.lsp.buf.type_definition()<CR>',
				desc = "Type Definition",
			},
			{
				"<leader>lR",
				'<cmd>lua vim.lsp.buf.rename()<CR>',
				desc = "Rename",
			},
			{
				"<leader>la",
				'<cmd>lua vim.lsp.buf.code_action()<CR>',
				desc = "Code Action",
			},
			{
				"<leader>le",
				'<cmd>lua vim.lsp.diagnostic.open_float()<CR>',
				desc = "Open Diagnostic Float",
			},
			{
				"<leader>l[",
				'<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
				desc = "Next Diagnostic",
			},
			{
				"<leader>l]",
				'<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
				desc = "Previous Diagnostic",
			},
		}
	},
}
