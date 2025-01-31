vim.loader.enable() -- You need to enable vim.loader before loading plugins

local lazypath = "@lazy_nvim@"
vim.opt.rtp:prepend(lazypath)

local configpath = "@turtton_nvim_config_path@"
vim.opt.rtp:prepend(configpath)

require("lazy").setup({
	defaults = { lazy = true },
	spec = "plugins",
	-- Prevent lazy.nvim from resetting `packpath` and `rtp` we set
	-- Original: https://github.com/asa1984/asa1984.nvim/blob/f65bd97c7d0322c2c160be66679d322e45b9f991/nvim/init.lua#L17C5-L24
	-- https://github.com/KFearsoff/website/blob/336bb1ba2bcb5a9a325bda3be653fa0e075b93ed/src/lazynvim-nixos.md
	performance = {
		reset_packpath = false,
		rtp = { reset = false },
	},
	install = { missing = false },
})
