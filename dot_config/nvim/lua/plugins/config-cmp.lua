return function()
	local cmp = require("cmp")
	local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
	local lspkind = require("lspkind")

	cmp.setup({
		snippet = {
			expand = function(args)
				vim.fn["UltiSnips#Anon"](args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
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
			format = function(entry, vim_item)
				local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
				local strings = vim.split(kind.kind, "%s", { trimempty = true })
				kind.kind = " " .. (strings[1] or "") .. " "
				kind.menu = "    (" .. (strings[2] or "") .. ")"

				return kind
			end,
		},
	})
end
