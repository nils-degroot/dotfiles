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
		formatting = {
			format = lspkind.cmp_format({
				mode = "symbol_text",
			}),
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
			{ name = "templates" },
			{ name = "orgmode" },
			{ name = "neorg" },
		},
		preselect = cmp.PreselectMode.Item,
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
	})
end
