return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "basedpyright", "jsonls" },
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"mypy",
					"ruff",
					"stylua",
					"sonarlint-language-server",
					"fixjson",
					"debugpy",
					"black",
					"isort",
					"flake8",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.basedpyright.setup({
				capabilities = capabilities,
				settings = {
					basedpyright = {
						typeCheckingMode = "off",
					},
				},
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "gh", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gl", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "rnm", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
