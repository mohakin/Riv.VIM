return {
	"nvim-lualine/lualine.nvim",
	event = 'UIEnter',
    --event = "UIEnter",
	opts = function()
		-- Clock
		local function clock()
			return os.date("%I:%M %p")
		end

		-- Active LSP clients for this buffer
		local function lsp_clients()
			local clients = vim.lsp.buf_get_clients(0)
			if not clients or vim.tbl_isempty(clients) then
				return "No LSP"
			end
			local names = {}
			for _, client in ipairs(clients) do
				table.insert(names, client.name)
			end
			return table.concat(names, ", ")
		end

		-- Configured linters for this filetype
		local function lint_providers()
			local ft = vim.bo.filetype
			local linters = require("lint").linters_by_ft[ft] or {}
			if #linters > 0 then
				return table.concat(linters, ", ")
			end
			return "No Lint"
		end

		-- Formatters that will run (and LSP fallback)
		local function format_providers()
			local infos, use_lsp = require("conform").list_formatters_to_run(0)
			local names = {}
			for _, info in ipairs(infos) do
				table.insert(names, info.name)
			end
			if use_lsp then
				table.insert(names, "LSP")
			end
			if #names > 0 then
				return table.concat(names, ", ")
			end
			return "No Fmt"
		end

		return {
			options = {
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = { "filename" },
				lualine_x = {
					lsp_clients,
					lint_providers,
					format_providers,
					clock,
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			extensions = {},
		}
	end,
}
