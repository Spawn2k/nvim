local M = {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
}

function M.config()
	require("catppuccin").setup({
		transparent_background = true,
		color_overrides = {
			mocha = {
				teal = "#F9E2AF",
				rosewater = "#74C7EC",
			},
		},
	})
	vim.cmd.colorscheme("catppuccin")
end

return M
