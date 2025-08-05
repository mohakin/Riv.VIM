return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter",
  opts = {
    model = "claude-3.7-sonnet",
    agent = "copilot",
    suggestion = {
      enabled = true,         -- turn on inline suggestions
      auto_trigger = true,    -- show suggestions as you type
      debounce = 75,          -- ms between requests
      keymap = {
        accept  = "<Tab>",    -- accept suggestion
        dismiss = "<S-c>",    -- decline suggestion
        next    = "<M-]>",    -- next suggestion (optional)
        prev    = "<M-[>",    -- prev suggestion (optional)
      },
      -- hide_during_completion = false,  -- uncomment if you want it hidden while nvim-cmp is open
    },
    panel = {
      enabled = true,        -- disable the floating Copilot panel
    },
    filetypes = {
      -- enable inline suggestions only in these filetypes (add as needed)
      markdown = true,
      help     = true,
      python  = true,
      go      = true,
      rust    = true,
      -- e.g. "python" = true, "javascript" = true, etc.
    },
  },
}
