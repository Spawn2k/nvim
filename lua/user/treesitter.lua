local M = {
	"nvim-treesitter/nvim-treesitter",
	-- event = { "BufReadPost", "BufNewFile" },
	-- build = ":TSUpdate",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			-- event = "VeryLazy",
		},
	},
}

function M.config()
	local wk = require("which-key")
	wk.register({
		["<leader>Ti"] = { "<cmd>TSConfigInfo<CR>", "Info" },
	})

	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"lua",
			"markdown",
			"markdown_inline",
			"bash",
			"python",
			"php",
			"css",
			"html",
			"javascript",
		}, -- put the language you want in this array
		ignore_install = { "" },
		sync_install = false,
		highlight = {
			enable = true,
			-- disable = { "markdown" },
			additional_vim_regex_highlighting = false,
		},
		auto_install = true,
		modules = {},
		indent = {
			enable = true,
			disable = { "yaml" },
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				-- init_selection = "gnn", -- set to `false` to disable one of the mappings
				-- node_incremental = "grn",
				-- scope_incremental = "grc",
				-- node_decremental = "grm",
                init_selection = "<C-s>",
				node_incremental = "<C-s>",
				scope_incremental = false,
				node_decremental = "<BS>",
			},
		},
		autopairs = { enable = true },
		textobjects = {
			select = {
				enable = true,
				-- Automatically jump forward to textobj, similar to targets.vim
				lookahead = true,
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["at"] = "@class.outer",
					["it"] = "@class.inner",
					["ac"] = "@call.outer",
					["ic"] = "@call.inner",
					["aa"] = "@parameter.outer",
					["ia"] = "@parameter.inner",
					["al"] = "@loop.outer",
					["il"] = "@loop.inner",
					["ai"] = "@conditional.outer",
					["ii"] = "@conditional.inner",
					["a/"] = "@comment.outer",
					["i/"] = "@comment.inner",
					["ab"] = "@block.outer",
					["ib"] = "@block.inner",
					["as"] = "@statement.outer",
					["is"] = "@scopename.inner",
					["aA"] = "@attribute.outer",
					["iA"] = "@attribute.inner",
					["aF"] = "@frame.outer",
					["iF"] = "@frame.inner",
				},
			},
		},
	})
end

return M
