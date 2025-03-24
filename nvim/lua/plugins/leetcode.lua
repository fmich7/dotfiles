return {
	"kawre/leetcode.nvim",
	lazy = "leetcode.nvim" ~= vim.fn.argv(0, -1),
	build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
	dependencies = {
		"nvim-telescope/telescope.nvim",
		-- "ibhagwan/fzf-lua",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	opts = require("configs.leetcode-config"),
}
