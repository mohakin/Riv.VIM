return {
  "folke/tokyonight.nvim",
  lazy = false,    -- Make sure the theme is loaded on startup
  priority = 1000, -- Make sure it loads before other plugins
  config = function()
    require("tokyonight").setup({
      -- Enable the transparent background
      transparent = true,
    })

    -- Set the colorscheme to the 'moon' variant
    vim.cmd("colorscheme tokyonight-moon")
  end,
}
