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
	},
	-- Enable tree-sitter highlight for inline code in .nix files
	{ name = "hmts.nvim", dir = "@hmts_nvim@", event = "BufRead", version = "*" },
}
