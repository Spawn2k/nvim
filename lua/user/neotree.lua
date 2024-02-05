local M = {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = false,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
}

function M.config()
		require("neo-tree").setup({
			window = {
				width = 30,
			},
		})
end

return M
