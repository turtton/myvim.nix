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
			-- Rust
			{ name = "rustacean.nvim", dir = "@rustacean_nvim@", opts = {} },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			local function is_available(server_name)
				local config = lspconfig[server_name]
				if not config then
					return false
				end
				local default_config = config.document_config and config.document_config.default_config
				if not default_config or not default_config.cmd then
					return false
				end
				local cmd = default_config.cmd
				if type(cmd) ~= "table" or type(cmd[1]) ~= "string" then
					return false
				end
				return vim.fn.executable(cmd[1]) == 1
			end

			local base_opts = { capabilities = capabilities }

			local server_list = require("plugins.lsp.server-list")
			for server, config in pairs(server_list) do
				if is_available(server) then
					local overrides
					if type(config) == "function" then
						overrides = config(capabilities)
					else
						overrides = config
					end
					lspconfig[server].setup(vim.tbl_deep_extend("force", base_opts, overrides))
				end
			end
		end,
		opts = {
			servers = {
				texlab = {
					keys = {
						{ "<Leader>K", "<plug>(vimtex-doc-package)", desc = "Vimtex Docs", silent = true },
					},
				},
			},
		},
		keys = {
			{
				"<leader>lK",
				"<cmd>lua vim.lsp.buf.hover()<CR>",
				desc = "Hover",
			},
			{
				"<leader>lf",
				"<cmd>lua vim.lsp.buf.formatting()<CR>",
				desc = "Format",
			},
			{
				"<leader>lr",
				"<cmd>lua vim.lsp.buf.references()<CR>",
				desc = "References",
			},
			{
				"<leader>ld",
				"<cmd>lua vim.lsp.buf.definition()<CR>",
				desc = "Definition",
			},
			{
				"<leader>lD",
				"<cmd>lua vim.lsp.buf.declaration()<CR>",
				desc = "Declaration",
			},
			{
				"<leader>li",
				"<cmd>lua vim.lsp.buf.implementation()<CR>",
				desc = "Implementation",
			},
			{
				"<leader>ls",
				"<cmd>lua vim.lsp.buf.signature_help()<CR>",
				desc = "Signature Help",
			},
			{
				"<leader>lt",
				"<cmd>lua vim.lsp.buf.type_definition()<CR>",
				desc = "Type Definition",
			},
			{
				"<leader>lR",
				"<cmd>lua vim.lsp.buf.rename()<CR>",
				desc = "Rename",
			},
			{
				"<leader>la",
				"<cmd>lua vim.lsp.buf.code_action()<CR>",
				desc = "Code Action",
			},
			{
				"<leader>le",
				"<cmd>lua vim.lsp.diagnostic.open_float()<CR>",
				desc = "Open Diagnostic Float",
			},
			{
				"<leader>l[",
				"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
				desc = "Next Diagnostic",
			},
			{
				"<leader>l]",
				"<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
				desc = "Previous Diagnostic",
			},
		},
	},

	{
		name = "otter.nvim",
		dir = "@otter_nvim@",
		dependencies = {
			{ name = "nvim-treesitter", dir = "@nvim_treesitter@" },
		},
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
		keys = {
			{
				"<leader>lo",
				'<cmd>lua require("otter").activate()<CR>',
				desc = "Activate Otter",
			},
		},
	},
}
