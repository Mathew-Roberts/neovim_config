return {
	"smoka7/hop.nvim",
	version = "*",
	config = function()
		require("hop").setup()
		vim.keymap.set("n", "<leader><leader>/", ":HopPattern<CR>", {})
		vim.keymap.set("n", "<leader><leader>f", ":HopChar1<CR>", {})
	end,
}
