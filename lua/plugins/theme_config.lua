return {
  -- 1. Theme Definitions with Transparency Enabled
  {
    "uhs-robert/oasis.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("oasis").setup({ style = "twilight" })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = { transparent_background = true },
  },
  {
    "folke/tokyonight.nvim",
    opts = { transparent = true },
  },
  {
    "ellisonleao/gruvbox.nvim",
    opts = { transparent_mode = true },
  },
  {
    "shaunsingh/nord.nvim",
    config = function()
      vim.g.nord_disable_background = true
    end,
  },
  {
    "Mofiqul/dracula.nvim",
    config = function()
      require("dracula").setup({ transparent_bg = true })
    end,
  },
  {
    "navarasu/onedark.nvim",
    opts = { transparent = true },
  },
  {
    "rebelot/kanagawa.nvim",
    opts = { transparent = true },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = { styles = { transparency = true } },
  },
  {
    "EdenEast/nightfox.nvim",
    opts = { options = { transparent = true } },
  },

  -- 2. Dependencies
  { "nvim-lua/plenary.nvim", lazy = true },

  -- 3. Theme Management & Persistence Logic
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
      {
        "<leader>ct",
        function()
          local themes = {
            "oasis-night", "oasis-midnight", "oasis-abyss", "oasis-starlight",
            "oasis-desert", "oasis-sol", "oasis-canyon", "oasis-dune",
            "oasis-cactus", "oasis-mirage", "oasis-lagoon", "oasis-twilight", "oasis-rose",
            "catppuccin-latte", "catppuccin-frappe", "catppuccin-macchiato", "catppuccin-mocha",
            "tokyonight", "tokyonight-night", "tokyonight-storm", "tokyonight-day", "tokyonight-moon",
            "gruvbox", "nord", "dracula", "dracula-soft", "onedark",
            "kanagawa", "kanagawa-wave", "kanagawa-dragon", "kanagawa-lotus",
            "rose-pine", "rose-pine-main", "rose-pine-moon", "rose-pine-dawn",
            "nightfox", "dayfox", "dawnfox", "duskfox", "nordfox", "terafox", "carbonfox",
          }
          vim.ui.select(themes, { prompt = "Select Theme:" }, function(choice)
            if choice then vim.cmd.colorscheme(choice) end
          end)
        end,
        desc = "Theme Picker",
      },
    },
    init = function()
      local state_file = vim.fn.stdpath("state") .. "/last_colorscheme.txt"

      -- Persistent background transparency fix
      local function apply_transparency()
        local groups = {
          "Normal", "NormalNC", "NormalFloat", "FloatBorder",
          "SignColumn", "EndOfBuffer", "MsgArea", "StatusLine", 
          "StatusLineNC", "WinSeparator", "TelescopeNormal", "TelescopeBorder"
        }
        for _, group in ipairs(groups) do
          vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
        end
      end

      -- Auto-save theme and re-apply transparency on change
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          local name = vim.g.colors_name
          if name and name ~= "" then
            pcall(vim.fn.writefile, { name }, state_file)
          end
          apply_transparency()
        end,
      })

      -- Load last used theme on startup
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          local ok, lines = pcall(vim.fn.readfile, state_file)
          local last = (ok and lines[1]) and lines[1]:gsub("%s+$", "") or "oasis-twilight"
          pcall(vim.cmd.colorscheme, last)
          apply_transparency() -- Force it one last time on boot
        end,
      })
    end,
  },
}
