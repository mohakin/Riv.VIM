return {
	"echasnovski/mini.statusline",
	version = false,
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"lewis6991/gitsigns.nvim",
	},
	config = function()
		local statusline = require("mini.statusline")

		-- Custom clock component
		local function clock()
			return os.date(" %I:%M %p")
		end

		-- Git signs summary (added/changed/removed)
		local function gitsigns_status()
			local gs = vim.b.gitsigns_status_dict
			if not gs then return "" end
			local parts = {}
			if gs.added and gs.added > 0 then table.insert(parts, "+" .. gs.added) end
			if gs.changed and gs.changed > 0 then table.insert(parts, "~" .. gs.changed) end
			if gs.removed and gs.removed > 0 then table.insert(parts, "-" .. gs.removed) end
			if #parts == 0 then return "" end
			return " " .. table.concat(parts, " ")
		end

		-- Custom active content
		local function active_content()
			local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
			local git = statusline.section_git({ trunc_width = 75, icon = "" })
			local diff = gitsigns_status()
			local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
			local filename = statusline.section_filename({ trunc_width = 140 })
			local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
			local location = statusline.section_location({ trunc_width = 75 })
			local time = clock()

			return statusline.combine_groups({
				{ hl = mode_hl, strings = { mode } },
				{ hl = "MiniStatuslineDevinfo", strings = { git, diff } },
				{ hl = "MiniStatuslineDevinfo", strings = { diagnostics } },
				"%<", -- truncate point
				{ hl = "MiniStatuslineFilename", strings = { filename } },
				"%=", -- right align
				{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
				{ hl = "MiniStatuslineFileinfo", strings = { location } },
				{ hl = mode_hl, strings = { time } },
			})
		end

		-- Inactive (unfocused) windows
		local function inactive_content()
			return "%#MiniStatuslineInactive#%f%="
		end

		statusline.setup({
			content = {
				active = active_content,
				inactive = inactive_content,
			},
			use_icons = true,
			set_vim_settings = true,
		})
	end,
}
