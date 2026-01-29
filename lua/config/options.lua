-- Number related
vim.opt.number = true -- Shows numbers
vim.opt.relativenumber = true -- Shows line number relative to othes lines
-- Cursor related
vim.opt.cursorline = true -- Helps to visually show what line you are on
vim.opt.mouse = "a" -- Mouse mode!
-- All about them tabs & indents
vim.opt.expandtab = true -- Converts tabs to spaces
vim.opt.shiftwidth = 4 -- Amount to indent
vim.opt.tabstop = 4 -- How many spaces are shown per tab
vim.opt.softtabstop = 4 -- How many spaces are applied when pressing tab
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true -- Keeps indentation from previous line
vim.opt.breakindent = true
-- Casing
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- list
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '⏟' }
-- Them splits
vim.opt.splitbelow = true -- Split horizontally
vim.opt.splitright = true -- Split vertically
-- fun options
vim.opt.columns = 120 -- Sets the character width to 120 characters
vim.opt.signcolumn = "yes"
vim.g.have_nerd_font = true
vim.opt.undofile = true -- Ass saver 9000
vim.opt.scrolloff = 10 -- Allows you to see a specific amount of lines below where you currently are -> set to 10 lines currently
vim.opt.showmode = false -- Status line takes care of this, this will give back one free line -> Don't spend it all in one place
vim.opt.inccommand = "split" -- preview substitutions as you write! (TJ-- what in the hell?)
vim.opt.cmdheight = 0 -- Oops... this is actually what saves you the line but still you don't need to see mode line twice!
vim.opt.winborder = "rounded" -- This is supposed to give windows borders... still looking into this

-- Transparency (applied after colorscheme loads)
vim.opt.termguicolors = true
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
    end,
})

-- Performance optimizations
vim.opt.lazyredraw = false       -- Don't redraw during macros
vim.opt.updatetime = 100        -- Faster CursorHold (default 4000ms)
vim.opt.timeoutlen = 300        -- Faster key sequence timeout
vim.opt.ttimeoutlen = 10        -- Faster escape sequences
vim.opt.ttyfast = true          -- Faster terminal connection

-- Hilight text for some time after yanking
local yank_group = vim.api.nvim_create_augroup("YankHighlight", {
clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function ()
        -- Works with any Neovim version
        local ok, _ = pcall(function()
            if vim.hl and vim.hl.on_yank then
                vim.hl.on_yank({ higroup = "IncSearch", timeout = 150 })
            elseif vim.highlight and vim.highlight.on_yank then
                vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
            end
        end)
    end,
    desc = "Highlight yank",
})

-- Diagnostics
vim.diagnostic.config({
    virtual_text = true,
    signs        = true,
    underline    = true,
    update_in_insert = false,
    severity_sort    = true,
    float = { border = "rounded", source = "always" },
})

