return {
	{
		name = "catppuccin-nvim",
		dir = "@catppuccin_nvim@",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
		opts = {
			integrations = {
				neotree = true,
				noice = true,
				which_key = true,
			},
		},
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
		keys = {
			{
				"<A-h>",
				'<cmd>lua require("smart-splits").resize_left()<CR>',
				desc = "Resize Left",
			},
			{
				"<A-j>",
				'<cmd>lua require("smart-splits").resize_down()<CR>',
				desc = "Resize Down",
			},
			{
				"<A-k>",
				'<cmd>lua require("smart-splits").resize_up()<CR>',
				desc = "Resize Up",
			},
			{
				"<A-l>",
				'<cmd>lua require("smart-splits").resize_right()<CR>',
				desc = "Resize Right",
			},
			{
				"<C-h>",
				'<cmd>lua require("smart-splits").move_cursor_left()<CR>',
				desc = "Move Cursor Left",
			},
			{
				"<C-j>",
				'<cmd>lua require("smart-splits").move_cursor_down()<CR>',
				desc = "Move Cursor Down",
			},
			{
				"<C-k>",
				'<cmd>lua require("smart-splits").move_cursor_up()<CR>',
				desc = "Move Cursor Up",
			},
			{
				"<C-l>",
				'<cmd>lua require("smart-splits").move_cursor_right()<CR>',
				desc = "Move Cursor Right",
			},
			{
				"<leader><leader>h",
				'<cmd>lua require("smart-splits").swap_buf_left()<CR>',
				desc = "Move Buffer Left",
			},
			{
				"<leader><leader>j",
				'<cmd>lua require("smart-splits").swap_buf_down()<CR>',
				desc = "Move Buffer Down",
			},
			{
				"<leader><leader>k",
				'<cmd>lua require("smart-splits").swap_buf_up()<CR>',
				desc = "Move Buffer Up",
			},
			{
				"<leader><leader>l",
				'<cmd>lua require("smart-splits").swap_buf_right()<CR>',
				desc = "Move Buffer Right",
			},
		},
	},

	-- Indent Visualization
	{
		name = "mini.indentscope",
		dir = "@mini_indentscope@",
		event = "VeryLazy",
		opts = { try_as_border = true },
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"Trouble",
					"alpha",
					"dashboard",
					"fzf",
					"help",
					"lazy",
					"mason",
					"neo-tree",
					"notify",
					"snacks_dashboard",
					"snacks_notif",
					"snacks_terminal",
					"snacks_win",
					"toggleterm",
					"trouble",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "SnacksDashboardOpened",
				callback = function(data)
					vim.b[data.buf].miniindentscope_disable = true
				end,
			})
		end,
	},

	-- Better buffer remove
	{ name = "mini.bufremove", dir = "@mini_bufremove@", evnet = "VeryLazy" },

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
	},

	-- Wakatime
	{
		name = "vim-wakatime",
		dir = "@vim_wakatime@",
		lazy = false,
	},

	-- Direnv
	{
		name = "direnv.vim",
		dir = "@direnv_vim@",
		lazy = false,
	},
}
