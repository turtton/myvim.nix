return {
	{
		name = "nvim-treesitter",
		dir = "@nvim_treesitter@",
		event = "BufReadPre",
		init = function()
			-- Add the treesitter parsers installed by Nix to the runtimepath
			vim.opt.rtp:append("@treesitter_parsers@")

			-- Enable treesitter highlighting and indentation via autocommand
			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local ft = args.match
					-- Skip latex (use vimtex instead)
					if ft == "latex" or ft == "tex" then
						return
					end
					-- Check if parser exists for this filetype
					local ok = pcall(vim.treesitter.start, args.buf)
					if ok then
						vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
	{
		name = "nvim-treesitter-textobjects",
		dir = "@nvim_treesitter_textobjects@",
		event = "BufReadPre",
		dependencies = {
			{ name = "nvim-treesitter", dir = "@nvim_treesitter@" },
		},
		config = function()
			require("nvim-treesitter-textobjects").setup({
				move = {
					set_jumps = true,
				},
			})

			local move = require("nvim-treesitter-textobjects.move")

			-- goto_next_start
			vim.keymap.set({ "n", "x", "o" }, "]f", function()
				move.goto_next_start("@function.outer", "textobjects")
			end, { desc = "Next function start" })
			vim.keymap.set({ "n", "x", "o" }, "]c", function()
				move.goto_next_start("@class.outer", "textobjects")
			end, { desc = "Next class start" })
			vim.keymap.set({ "n", "x", "o" }, "]a", function()
				move.goto_next_start("@parameter.inner", "textobjects")
			end, { desc = "Next parameter start" })

			-- goto_next_end
			vim.keymap.set({ "n", "x", "o" }, "]F", function()
				move.goto_next_end("@function.outer", "textobjects")
			end, { desc = "Next function end" })
			vim.keymap.set({ "n", "x", "o" }, "]C", function()
				move.goto_next_end("@class.outer", "textobjects")
			end, { desc = "Next class end" })
			vim.keymap.set({ "n", "x", "o" }, "]A", function()
				move.goto_next_end("@parameter.inner", "textobjects")
			end, { desc = "Next parameter end" })

			-- goto_previous_start
			vim.keymap.set({ "n", "x", "o" }, "[f", function()
				move.goto_previous_start("@function.outer", "textobjects")
			end, { desc = "Previous function start" })
			vim.keymap.set({ "n", "x", "o" }, "[c", function()
				move.goto_previous_start("@class.outer", "textobjects")
			end, { desc = "Previous class start" })
			vim.keymap.set({ "n", "x", "o" }, "[a", function()
				move.goto_previous_start("@parameter.inner", "textobjects")
			end, { desc = "Previous parameter start" })

			-- goto_previous_end
			vim.keymap.set({ "n", "x", "o" }, "[F", function()
				move.goto_previous_end("@function.outer", "textobjects")
			end, { desc = "Previous function end" })
			vim.keymap.set({ "n", "x", "o" }, "[C", function()
				move.goto_previous_end("@class.outer", "textobjects")
			end, { desc = "Previous class end" })
			vim.keymap.set({ "n", "x", "o" }, "[A", function()
				move.goto_previous_end("@parameter.inner", "textobjects")
			end, { desc = "Previous parameter end" })
		end,
	},
	-- Enable tree-sitter highlight for inline code in .nix files
	{ name = "hmts.nvim", dir = "@hmts_nvim@", event = "BufRead", version = "*" },
}
