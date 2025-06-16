vim.g.mapleader = " "
vim.keymap.set("n", "<leader>q", vim.cmd.q, {desc = "Quit"})
vim.keymap.set("n", "<leader>w", vim.cmd.w, {desc = "Save file"})
        vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", {desc = "Opens Parent Dir In Oil"})

vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Outdent" })
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent" })

vim.keymap.set("n", "<leader>cf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer with Conform" })
