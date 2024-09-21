return {
	{
		name = "catppuccin-nvim",
		dir = "@catppuccin_nvim@",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme "catppuccin-mocha"
		end,
		opts = {
			integrations = {
				neotree = true,
				noice = true,
				which_key = true,
			},
		}
	},

	-- Docs (ja)
	{
		name = "vimdoc-ja",
		dir = "@vimdoc_ja@",
		event = "VeryLazy",
	},

	-- Better escape
	{
		name = "better-escape.nvim",
		dir = "@better_escape_nvim@",
		event = "InsertCharPre",
		opts = {
			mapping = { "jj" },
			timeout = 200,
		},
	},

	-- Better pane navigation
	{
		name = "smart-splits.nvim",
		dir = "@smart_splits_nvim@",
		opts = {
			ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" },
			ignored_buftypes = { "nofile" },
		},
	},

	-- Better buffer remove
	{ name = "mini.bufremove", dir = "@mini_bufremove@" },

	-- Auto enclose deliminators
	{
		name = "nvim-autopairs",
		dir = "@nvim_autopairs@",
		event = "InsertEnter",
		opts = {
			map_c_h = true,
		},
	},

	-- Better sort
	{
		name = "sort.nvim",
		dir = "@sort_nvim@",
		cmd = "Sort",
		config = true,
	},

	-- Key viewer
	{
		name = "which-key.nvim",
		dir = "@which_key_nvim@",
		event = "VeryLazy",
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	}
}

