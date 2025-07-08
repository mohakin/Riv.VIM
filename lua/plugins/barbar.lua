return {
  {'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    event = "BufReadPre",
    init = function() vim.g.barbar_auto_setup = false
    end,
    opts = {
   -- Enable/disable animations
      animation = true,

     -- Enable/disable auto-hiding the tab bar when there's only one tab
      auto_hide = false,

      -- Enable/disable current/total tab count (e.g. 1/4)
      tabpages = true,

      -- Enables/disables clickable tabs
      --  - left-click: go to tab
      --  - middle-click: close tab
      clickable = true,

      icons = {
        -- THIS IS THE LINE. THIS IS WHAT YOU WANT.
        buffer_index = true,
        button = "", -- Close button
        -- Other icon settings...
      },
      version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },
  }
}
