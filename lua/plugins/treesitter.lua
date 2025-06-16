return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            highlight = {
                enable = true,
            },
            indent = { enable = true },
            -- The autotag line has been removed
            ensure_installed = {
                "lua",
                "go",
                "vim",
                "vimdoc",
                "python",
                "yaml",
            },
            auto_install = false,
        })
    end,
}
