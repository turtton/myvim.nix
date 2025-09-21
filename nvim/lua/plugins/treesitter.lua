return {
	{
		name = "nvim-treesitter",
		dir = "@nvim_treesitter@",
		event = "BufReadPre",
		init = function()
			-- Add the treesitter parsers installed by Nix to the runtimepath
			vim.opt.rtp:append("@treesitter_parsers@")
			require("nvim-treesitter.configs").setup({
				auto_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				textobjects = {
					move = {
						enable = true,
						goto_next_start = {
							["]f"] = "@function.outer",
							["]c"] = "@class.outer",
							["]a"] = "@parameter.inner",
						},
						goto_next_end = {
							["]F"] = "@function.outer",
							["]C"] = "@class.outer",
							["]A"] = "@parameter.inner",
						},
						goto_previous_start = {
							["[f"] = "@function.outer",
							["[c"] = "@class.outer",
							["[a"] = "@parameter.inner",
						},
						goto_previous_end = {
							["[F"] = "@function.outer",
							["[C"] = "@class.outer",
							["[A"] = "@parameter.inner",
						},
					},
				},
			})
		end,
		opts = function(_, opts)
			opts.highlight = opts.highlight or {}
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "bibtex" })
			end
			if type(opts.highlight.disable) == "table" then
				vim.list_extend(opts.highlight.disable, { "latex" })
			else
				opts.highlight.disable = { "latex" }
			end
		end,
	},
	-- Enable tree-sitter highlight for inline code in .nix files
	{ name = "hmts.nvim", dir = "@hmts_nvim@", event = "BufRead", version = "*" },
}
