return {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.config")

        config.setup({
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
                "rust",
            },
            auto_install = false,
        })
    end,
}
