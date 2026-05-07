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
			{ name = "rustacean.nvim", dir = "@rustaceanvim@" },
		},
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			local server_list = require("plugins.lsp.server-list")
			for server, config in pairs(server_list) do
				local overrides
				if type(config) == "function" then
					overrides = config(capabilities)
				else
					overrides = config
				end
				vim.lsp.config(server, overrides)
			end

			vim.lsp.enable(vim.tbl_keys(server_list))
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

	{
		name = "kotlin.nvim",
		dir = "@kotlin_nvim@",
		ft = { "kotlin" },
		cond = function()
			local dir = os.getenv("KOTLIN_LSP_DIR")
			return dir ~= nil and dir ~= ""
		end,
		opts = (function()
			local java_home = os.getenv("JAVA_HOME")
			if java_home and java_home ~= "" then
				return { jre_path = java_home }
			end
			return {}
		end)(),
	},
}
