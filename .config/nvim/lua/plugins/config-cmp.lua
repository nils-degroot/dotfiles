local cmp_kinds = {
	Text = "  ",
	Method = "  ",
	Function = "  ",
	Constructor = "  ",
	Field = "  ",
	Variable = "  ",
	Class = "  ",
	Interface = "  ",
	Module = "  ",
	Property = "  ",
	Unit = "  ",
	Value = "  ",
	Enum = "  ",
	Keyword = "  ",
	Snippet = "  ",
	Color = "  ",
	File = "  ",
	Reference = "  ",
	Folder = "  ",
	EnumMember = "  ",
	Constant = "  ",
	Struct = "  ",
	Event = "  ",
	Operator = "  ",
	TypeParameter = "  ",
}

return function()
	local cmp = require("cmp")
	local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

	cmp.setup({
		snippet = {
			expand = function(args)
				vim.fn["UltiSnips#Anon"](args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-u>"] = cmp.mapping.scroll_docs(-4),
			["<C-d>"] = cmp.mapping.scroll_docs(4),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}),
			["<Tab>"] = cmp.mapping(function(fallback)
				cmp_ultisnips_mappings.compose({ "jump_forwards", "select_next_item" })(fallback)
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				cmp_ultisnips_mappings.compose({ "jump_backwards", "select_prev_item" })(fallback)
			end, { "i", "s" }),
		}),
		sources = {
			{ name = "ultisnips" },
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "nvim_lsp_signature_help" },
			{ name = "buffer" },
			{ name = "path" },
			{ name = "crates" },
		},
		preselect = cmp.PreselectMode.Item,
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(_, vim_item)
				vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind
				return vim_item
			end,
		},
	})
end