local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = false,
	ext_opts = {
		[types.choiceNode] = {
			acitve = {
				virt_text = { { "<-", "Error" } },
			},
		},
	},
})

vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set("i", "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

vim.keymap.set("n", "<Leader>s", "<cmd>source ~/.config/nvim/plugin/luasnip.lua<CR>")

local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local t = ls.text_node
local rep = require("luasnip.extras").rep
local c = ls.choice_node
local f = ls.function_node

ls.add_snippets("all", {
	s(
		"todo",
		fmt([[{} {}: {}]], {
			c(1, {
				t("TODO (olekatpyle) "),
				t("FIXME (olekatpyle) "),
				t("TODONT (olekatple) "),
				t("NOTE (olekatple) "),
			}),
			f(function()
				return os.date("%D - %H:%M")
			end),
			i(2, "message"),
		})
	),
})

ls.add_snippets("lua", {
	s("req", fmt("local {} = require('{}')", { i(1, "var"), i(2, "plugin") })),
})

ls.add_snippets("html", {
	s(
		"!",
		fmt(
			'<!DOCTYPE html>\n<html lang="de">\n  <head>\n    <meta charset="UTF-8">\n    <meta name="viewport" content="width=device-width, initial-scale=1.0">\n    <title>{}</title>\n  </head>\n  <body>\n\n  </body>\n</html>',
			{ i(1, "Document") }
		)
	),
	s(".div", fmt('<div class="{}">{}</div>', { i(1), i(2) })),
	s("#div", fmt('<div id="{}">{}</div>', { i(1), i(2) })),
	s("div", fmt("<div>{}</div>", { i(1) })),
	s(".ul", fmt('<ul class="{}">\n  <li>{}</li>\n</ul>', { i(1), i(2) })),
	s("#ul", fmt('<ul id="{}">\n  <li>{}</li>\n</ul>', { i(1), i(2) })),
	s("ul", fmt("<ul>\n  <li>{}</li>\n</ul>", { i(1) })),
	s("a", fmt([[<a href="{}">{}</a>]], { i(1), i(2) })),
	s("scr", fmt([[<script src="{}">{}</script>]], { i(1), i(2) })),
	s("link", fmt([[<link rel="{}" href="{}">]], { i(1), i(2) })),
	s("img", fmt([[<img {}>]], { i(1) })),
	s("h", fmt("<h{}>{}</{}>", { i(1), i(2), rep(1) })),
	s("p", fmt("<p>{}</p>", { i(1) })),
})

ls.filetype_extend("javascript", { "html" })
ls.filetype_extend("typescript", { "html" })
ls.filetype_extend("jsx", { "html" })
ls.filetype_extend("tsx", { "html" })
ls.filetype_extend("typescript", { "javascript" })
ls.filetype_extend("tsx", { "jsx" })
