vim.loader.enable() -- You need to enable vim.loader before loading plugins

local lazypath = "@lazy_nvim@"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    defaults = { lazy = true },
    spec = "plugins",
})