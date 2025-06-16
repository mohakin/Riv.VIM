return {
	"stevearc/oil.nvim",
	opts = {
		view_options = {
			show_hidden = true,
		},
	},
	-- Optional dependencies
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- Lazy loading is not recommended becuase it is very tricky to make work correctly.
	lazy = false,
}
