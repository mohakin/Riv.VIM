return{
    {
        'stevearc/conform.nvim',
        opts = {},
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
