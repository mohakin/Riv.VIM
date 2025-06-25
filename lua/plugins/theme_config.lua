return {
	"rebelot/kanagawa.nvim",
	lazy = false, -- Make sure the theme is loaded on startup
	priority = 1000, -- Make sure it loads before other plugins
	config = function()
		require("kanagawa").setup({
			-- Your kanagawa configuration options go here
			-- For example:
			transparent = false,
			terminalColors = true,
			keywordStyle = { italic = false },
		})

		-- Set the colorscheme
		vim.cmd("colorscheme kanagawa-dragon")
	end,
}
