return {
	name = "telescope.nvim",
	dir = "@telescope_nvim@",
	cmd = "Telescope",
	dependencies = {
		{ name = "plenary.nvim",                dir = "@plenary_nvim@" },
		{ name = "telescope-file-browser.nvim", dir = "@telescope_file_browser_nvim@" },
	},
	opts = function()
		local telescope_actions = require("telescope.actions")
		return {
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					".git",
					".direnv",
				},
				mappings = {
					n = {
						["q"] = telescope_actions.close,
					},
				},
			},
		}
	end,
	keys = {
		{
			"<leader>ff",
			function()
				require('telescope.builtin').find_files()
			end,
			desc = "Find files",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Live grep",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Find Buffers",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Help tags",
		},
	},
}