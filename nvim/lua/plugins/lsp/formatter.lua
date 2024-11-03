return {
	{
		name = "conform.nvim",
		dir = "@conform_nvim@",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		config = function()
			require("conform").setup({
				formatters = {
					biome_for_project = biome_for_project,
					prettier_for_project = prettier_for_project,
					stylua = { require_cwd = true },
				},
				formatters_by_ft = {
					-- Config like
					json = prettier_like_formatters,
					jsonc = prettier_like_formatters,
					toml = { "taplo" },
					yaml = { "prettier" },

					-- Web frameworks
					angular = { "prettier" },
					astro = { "prettier" },
					svelte = { "prettier" },
					vue = { "prettier" },

					lua = { "stylua" },
					nix = { "nixfmt" },
					haskell = { "fourmolu" },

					-- Misc
					sh = { "shfmt" },
				},
				default_format_opts = {
					lsp_format = "fallback",
				},
				format_on_save = function(bufnr)
					if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
						return
					end
					return {
						timeout_ms = 500,
					}
				end,
			})

			vim.api.nvim_create_user_command("FormatDisable", function(args)
				if args.bang then
					-- FormatDisable! will disable formatting just for this buffer
					vim.b.disable_autoformat = true
				else
					vim.g.disable_autoformat = true
				end
			end, {
				desc = "Disable autoformat-on-save",
				bang = true,
			})

			vim.api.nvim_create_user_command("FormatEnable", function()
				vim.b.disable_autoformat = false
				vim.g.disable_autoformat = false
			end, {
				desc = "Re-enable autoformat-on-save",
			})
		end,
	},
}

