return {
	-- Statusline & Tabline
	{
		name = "heirline.nvim",
		dir = "@heirline_nvim@",
		event = "BufEnter",
		opts = function()
			return {
				statusline = require("plugins.heirline.statusline"),
				tabline = require("plugins.heirline.tabline"),
				opts = {
					colors = require("catppuccin.palettes").get_palette("mocha"),
				},
			}
		end,
	},
}
