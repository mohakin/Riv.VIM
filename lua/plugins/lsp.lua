return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
					"pylsp",
					"yamlls",
				},
			})

			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local servers = require("mason-lspconfig").get_installed_servers()
			for _, server_name in ipairs(servers) do
				lspconfig[server_name].setup({
					capabilities = capabilities, -- Uncomment if you use nvim-cmp
					-- on_attach = function(client, bufnr) ... end, -- Add keymaps here
				})
			end

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim", "Snacks" },
						},
					},
				},
			})
		end,
	},
}
