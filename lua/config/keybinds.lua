-- Standard keybinds for Neovim
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>q", vim.cmd.q, {desc = "Quit"})
vim.keymap.set("n", "<leader>w", vim.cmd.w, {desc = "Save file"})
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Outdent" })
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent" })

-- Oil keybinds for file management
vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", {desc = "Opens Parent Dir In Oil"})

-- Conform keybinds for formatting
vim.keymap.set("n", "<leader>cf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer with Conform" })

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
