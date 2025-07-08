return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy", -- Load this plugin when Neovim is idle
  version = "*", -- or pin to a specific version
  opts = {
    -- Hitting Esc in a terminal window will send the sequence to the terminal
    -- program, which is almost always what you want.
    start_in_insert = true,
    -- open the terminal in insert mode
    insert_mappings = true,
    -- use visual cues for the terminal buffer
    shade_terminals = true,
    shading_factor = 2,
    -- Make the default direction a float because it's awesome.
    direction = "float",
    float_opts = {
      -- A nice, clean border.
      border = "curved",
    },
  },
}
