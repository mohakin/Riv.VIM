-- Standard keybinds for Neovim
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>q", vim.cmd.q, {desc = "Quit"})
vim.keymap.set("n", "<leader>w", vim.cmd.w, {desc = "Save file"})
vim.keymap.set("n", "<leader>rb", "<cmd>e<CR>", {desc = "Reload buffer"})
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Outdent" })
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent" })

-- Rename Keybind
vim.keymap.set("n", "<leader>rn", ":IncRename ", { desc = "Incremental Rename" })

-- Oil keybinds for file management
vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", {desc = "Opens Parent Dir In Oil"})

-- Conform keybinds for formatting
vim.keymap.set("n", "<leader>cf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer with Conform" })

-- Oasis theme: cycle variants
vim.keymap.set("n", "<leader>ct", function()
  local state_file = vim.fn.stdpath("state") .. "/oasis_last_colorscheme.txt"
  local schemes = {
    "oasis-night",
    "oasis-midnight",
    "oasis-abyss",
    "oasis-starlight",
    "oasis-desert",
    "oasis-sol",
    "oasis-canyon",
    "oasis-dune",
    "oasis-cactus",
    "oasis-mirage",
    "oasis-lagoon",
    "oasis-twilight",
    "oasis-rose",
  }

  local current = vim.g.colors_name or ""
  local idx = 0
  for i, name in ipairs(schemes) do
    if name == current then
      idx = i
      break
    end
  end

  local next_name = schemes[(idx % #schemes) + 1]
  vim.cmd.colorscheme(next_name)
  pcall(vim.fn.writefile, { next_name }, state_file)
  vim.notify("Colorscheme: " .. next_name)
end, { desc = "Cycle Oasis theme variants" })

-- Neogit keybinds for Git integration
vim.keymap.set("n", "<leader>gg", function()
  require("neogit").open({ kind = "tab" })
end, { desc = "Open Neogit in a new tab" })

vim.keymap.set("n", "<leader>gs", function()
  require("neogit").open({ kind = "split" })
end, { desc = "Open Neogit in a split" })

-- Diffview keybinds for viewing diffs
vim.keymap.set("n", "<leader>gd", function()
  require("diffview").open()
end, { desc = "Open Diffview" })
vim.keymap.set("n", "<leader>gD", function()
  require("diffview").close()
end, { desc = "Close Diffview" })

-- Git history
vim.keymap.set("n", "<leader>gl", "<cmd>DiffviewFileHistory<CR>", { desc = "Git log (repo)" })
vim.keymap.set("n", "<leader>gf", "<cmd>DiffviewFileHistory %<CR>", { desc = "Git log (current file)" })
