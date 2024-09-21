return {
	-- Highlight git changes
	{
		name = "gitsigns.nvim",
		dir = "@gitsigns_nvim@",
		event = { "BufRead", "BufNewFile" },
		opts = {},
	},
	{
		name = "lazygit.nvim",
		dir = "@lazygit_nvim@",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			{ name = "nvim-lua/plenary.nvim", dir = "@plenary@" },
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" }
		}
	},
}

