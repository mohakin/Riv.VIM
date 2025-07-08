return{
    {
        'stevearc/conform.nvim',
        opts = {},
        event = "VeryLazy",
        config = function ()
            require("conform").setup({
            formatters_by_ft = {
            lua = { "stylua" },
            rust = { "rustfmt", lsp_format = "fallback" },
            python = { "black" },
            go = { "gofumpt", "gotests", "goimports", "gomodifytags" },
            yaml = { "yamlfmt" },
            },
        })
        end
    }
}
