return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    keys = {
        {
            "<leader>?",
            function()
                -- Show global leader maps (your mappings in config/keybinds.lua are global)
                require("which-key").show()
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
