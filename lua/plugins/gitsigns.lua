return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		-- Inline blame at end of line
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 300, -- ms before showing blame
			ignore_whitespace = true,
		},
		current_line_blame_formatter = "   <author> • <author_time:%Y-%m-%d> • <summary>",

		-- Signs in the gutter
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "▁" },
			topdelete = { text = "▔" },
			changedelete = { text = "▎" },
		},

		-- Keymaps
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation between hunks
			map("n", "]h", gs.next_hunk, { desc = "Next git hunk" })
			map("n", "[h", gs.prev_hunk, { desc = "Prev git hunk" })

			-- Actions
			map("n", "<leader>gb", gs.blame_line, { desc = "Blame line (full)" })
			map("n", "<leader>gB", function() gs.blame_line({ full = true }) end, { desc = "Blame line (detailed)" })
			map("n", "<leader>gtb", gs.toggle_current_line_blame, { desc = "Toggle inline blame" })
			map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview hunk" })
		end,
	},
}
