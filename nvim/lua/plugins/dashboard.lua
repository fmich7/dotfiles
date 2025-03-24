return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("configs.dashboard-config")
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
