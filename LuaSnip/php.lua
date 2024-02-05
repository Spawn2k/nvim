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

ls.add_snippets("php", {
	s("pubf", {
		t({ "public function " }),
		i(1),
		t("("),
		i(2),
		t(")"),
		i(3),
		t({ "", "" }),
		t({ "{", "\t" }),
		i(4),
		t({ "", "" }),
		t("}"),
	}),

	s(
		"pubsf",
		fmt(
			[[
                public static funtion <>(<>)<>
                {
                    <>
                }
            ]],
			{ i(1), i(2), i(3), i(4) },
			{ delimiters = "<>" }
		)
	),

	s(
		"prof",
		fmt(
			[[
                protected funtion {}({}){}
                {{
                    {}
                }}
            ]],
			{ i(1), i(2), i(3), i(4) }
			-- { delimiters = "<>" }
		)
	),

	s(
		"prof",
		fmt(
			[[
                protected funtion {}({}){}
                {{
                    {}
                }}
            ]],
			{ i(1), i(2), i(3), i(4) }
			-- { delimiters = "<>" }
		)
	),

	s(
		"prof",
		fmt(
			[[
                protected funtion {}({}){}
                {{
                    {}
                }}
            ]],
			{ i(1), i(2), i(3), i(4) }
			-- { delimiters = "<>" }
		)
	),

	s(
		"prof",
		fmt(
			[[
                protected funtion {}({}){}
                {{
                    {}
                }}
            ]],
			{ i(1), i(2), i(3), i(4) }
			-- { delimiters = "<>" }
		)
	),

	s(
		"prosf",
		fmt(
			[[
                protected static funtion {}({}){}
                {{
                    {}
                }}
            ]],
			{ i(1), i(2), i(3), i(4) }
			-- { delimiters = "<>" }
		)
	),

	s(
		"prisf",
		fmt(
			[[
                private static funtion {}({}){}
                {{
                    {}
                }}
            ]],
			{ i(1), i(2), i(3), i(4) }
			-- { delimiters = "<>" }
		)
	),

	s(
		"prisf",
		fmt(
			[[
                private static funtion {}({}){}
                {{
                    {}
                }}
            ]],
			{ i(1), i(2), i(3), i(4) }
			-- { delimiters = "<>" }
		)
	),

	s(
		"prif",
		fmt(
			[[
                private funtion {}({}){}
                {{
                    {}
                }}
            ]],
			{ i(1), i(2), i(3), i(4) }
			-- { delimiters = "<>" }
		)
	),

	s(
		"pubc",
		fmt(
			[[
                public function __construct({}){}
                {{
                    {}
                }}
            ]],
			{ i(1), i(2), i(3) }
			-- { delimiters = "<>" }
		)
	),

	s(
		"gget",
		fmt(
			[[
                $_GET['{}']
            ]],
			{ i(1) }
			-- { delimiters = "<>" }
		)
	),

	s(
		"gpost",
		fmt(
			[[
                $_POST['{}']
            ]],
			{ i(1) }
			-- { delimiters = "<>" }
		)
	),

	s(
		"gss",
		fmt(
			[[
                $_SESSION['{}']
            ]],
			{ i(1) }
			-- { delimiters = "<>" }
		)
	),

	s(
		"gser",
		fmt(
			[[
                $_SERVER['{}']
            ]],
			{ i(1) }
			-- { delimiters = "<>" }
		)
	),

	s(
		"greq",
		fmt(
			[[
                $_REQUEST['{}']
            ]],
			{ i(1) }
			-- { delimiters = "<>" }
		)
	),

	s("cle", {
		t("class "),
		f(return_filename),
		t(" extends "),
		i(1),
		t({ "", "" }),
		t("{"),
		t({ "", "" }),
		t("\t"),
		i(2),
		t({ "", "" }),
		t("}"),
	}),

	s("cl", {
		t("class "),
		f(return_filename),
		t({ "", "" }),
		t("{"),
		t({ "", "" }),
		t("\t"),
		i(1),
		t({ "", "" }),
		t("}"),
	}),
})

ls.add_snippets("php", {
	s("@ifelse", {
		t("<?php if ("),
		i(1),
		t(") { ?>"),
		t({ "", "" }),
		t("\t"),
		i(2),
		t({ "", "" }),
		t("<?php } else { ?>"),
		t({ "", "" }),
		t("\t"),
		i(3),
		t({ "", "" }),
		t("<?php } ?>"),
	}),

	s(
		"@foreach",
		fmt(
			[[
                <?php foreach ({} as {} => {}) {{ ?>
                    {}
                <?php }} ?>
            ]],
			{
				i(1, "$array"),
				i(2, "$key"),
				i(3, "$value"),
				i(4),
			}
		)
	),

	s("@if", {
		t("<?php if ("),
		i(1),
		t(") { ?>"),
		t({ "", "" }),
		t("\t"),
		i(2),
		t({ "", "" }),
		t("<?php } ?>"),
	}),

	s("phpe", {
		t("<?php echo "),
		i(1),
		t(" ?>"),
	}),
})
