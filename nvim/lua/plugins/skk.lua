return {
    name = "skkeleton",
    dir = "@skkeleton@",
    lazy = false,
    dependencies = {
        { name = "denops.vim", dir = "@denops_vim@" },
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "skkeleton-initialize-pre",
            callback = function()
                vim.fn["skkeleton#config"]({
                    eggLikeNewline = true,
                    registerConvertResult = true,
                    globalDictionaries = {
                        "@skk_dict@",
                    },
                })
            end,
        })
    end,
    config = function()
        vim.api.nvim_eval("add(g:skkeleton#mapped_keys, '<Tab>')")
        vim.fn["skkeleton#register_keymap"]("henkan", "<Tab>", "kakutei")
    end,
    keys = {
        { "<C-j>", "<Plug>(skkeleton-enable)", mode = "i", desc = "enable skkeleton" },
        { "<C-j>", "<Plug>(skkeleton-enable)", mode = "c", desc = "enable skkeleton" },
        { "<C-,>", "<C-o>:call skkeleton#register_kanatable('rom', {',': ['，', ''], '.' : ['．', '']})<CR><Plug>(skkeleton-enable)", mode = "i", desc = "skkeleton: , to ，" },
        { "<C-.>", "<C-o>:call skkeleton#register_kanatable('rom', {',': [',', ''], '.' : ['.', '']})<CR><Plug>(skkeleton-enable)", mode = "i", desc = "skkeleton: ． to ." },
    },
}
