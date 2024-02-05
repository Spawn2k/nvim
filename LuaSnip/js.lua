local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
local c = ls.choice_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node

local return_filename = function()
	local file_name = vim.fn.fnamemodify(vim.fn.expand("%"), ":t")
	local class_name = file_name:sub(0, #file_name - 4)
	return class_name
end

vim.keymap.set({ "i", "s" }, "<A-n>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

vim.keymap.set({ "i", "s" }, "<A-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

ls.add_snippets("javascript", {
	s(
		"cfn",
		fmt(
			[[
            const {} = ({}) => {{
                {}
            }}
        ]],
			{
				i(1),
				i(2),
				i(3),
			}
		)
	),

	s(
		"vjs",
		fmt(
			[[
	            'use strict';

	            (() => {{

	                // === DOM & VARS ========
                    const DOM = {{}};
                    {}
                    // === INIT ==============
                    const init = () => {{

                    }}

                    // === EVENTHANDLER ======

                    // === XHR/FETCH =========
                    
                    init();


                }})();
	           ]],
			{ i(1) }
		)
	),
})
