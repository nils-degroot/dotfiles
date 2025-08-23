vim.o.number = true
vim.o.relativenumber = true
vim.o.linebreak = true
vim.o.winborder = "rounded"
vim.o.signcolumn = "yes"

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.scrolloff = 5
vim.opt.termguicolors = true

vim.g.mapleader = " "

-- List stuff
vim.opt.list = true
vim.opt.listchars = {
	tab = "·┈",
	trail = "￮",
	multispace = "￮",
	lead = " ",
	extends = "▶",
	precedes = "◀",
	nbsp = "‿",
}

-- Persistent undo
local undo_dir = vim.fn.expand("~/.local/share/vim-undo")

if vim.fn.has("persistent_undo") then
	if not vim.fn.isdirectory(undo_dir) then
		os.execute("mkdir -p " .. undo_dir)
	end

	vim.opt.undodir = undo_dir
	vim.opt.undofile = true
end

-- Highlighted yank
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = { "*" },
	callback = function()
		vim.hl.on_yank({ timeout = 500 })
	end,
})

vim.keymap.set("n", "<leader>o", ":update<cr>:so<cr>")
vim.keymap.set("n", "-", ":Oil<cr>")

vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y<cr>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', '"+d<cr>')

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<leader>pf", ":FzfLua files<cr>")
vim.keymap.set("n", "<leader>bb", ":FzfLua buffers<cr>")
vim.keymap.set("n", "<leader>cf", ":FzfLua live_grep_native<cr>")
vim.keymap.set("n", "<leader>h", ":FzfLua helptags<cr>")

vim.pack.add({
	-- Core
	"https://github.com/srcery-colors/srcery-vim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/echasnovski/mini.surround",
	"https://github.com/echasnovski/mini.completion",
	"https://github.com/echasnovski/mini.icons",
	"https://github.com/echasnovski/mini.pairs",
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/echasnovski/mini.snippets",
	-- "https://github.com/L3MON4D3/LuaSnip",

	-- Ui
	"https://github.com/folke/todo-comments.nvim",
	"https://github.com/j-hui/fidget.nvim",

	-- Programming
	"https://github.com/mrcjkb/rustaceanvim",

	-- Sql
	"https://github.com/tpope/vim-dadbod",
	"https://github.com/kristijanhusak/vim-dadbod-ui",
	"https://github.com/kristijanhusak/vim-dadbod-completion",
})

vim.diagnostic.config({ virtual_text = true })
vim.lsp.inlay_hint.enable()

require("oil").setup({
	columns = { "mtime" },
	delete_to_trash = true,
	view_options = {
		show_hidden = true,
	}
})

require("mini.surround").setup()

require("mini.completion").setup()

require("mini.pairs").setup()

require("fzf-lua").setup({
	fzf_bin = 'sk',
	grep = {
		hidden = true
	}
})

require("nvim-treesitter.configs").setup({
	ensure_installed = { "rust", "nu", "lua" },
	highlight = { enable = true }
})

require("todo-comments").setup({})

require("fidget").setup({})

vim.cmd("color srcery")

-- Nasty vue_ls setup
vim.lsp.config("vtsls", {
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					{
						name = "@vue/typescript-plugin",
						location = "~/.local/share/pnpm/global/5/node_modules/@vue/language-server",
						languages = { "vue" },
						configNamespace = "typescript",
					},
				},
			},
		},
	},
	filetypes = { 'vue' },
})

-- Append nvim runtime to lua_ls
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true)
			}
		}
	}
})

local base_on_attach = vim.lsp.config.eslint.on_attach
vim.lsp.config("eslint", {
	on_attach = function(client, bufnr)
		if not base_on_attach then return end
		base_on_attach(client, bufnr)

		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "LspEslintFixAll",
		})
	end,
})

vim.lsp.enable({ "lua_ls", "eslint", "vtsls", "vue_ls", "ts_ls" })

require('bar')

local snippets = require("mini.snippets")
snippets.setup({
	snippets = {
		snippets.gen_loader.from_lang()
	},
})

-- Lsping
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = true })
		vim.keymap.set("n", "<leader>sd", vim.lsp.buf.hover, { buffer = true })
		vim.keymap.set("n", "<leader>sr", vim.lsp.buf.references, { buffer = true })
		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = true })
		vim.keymap.set("n", "<tab>", ":FzfLua lsp_code_actions<cr>")
		vim.keymap.set("n", "<leader>cw", ":FzfLua lsp_workspace_diagnostics<cr>")
		vim.keymap.set("n", "<leader>gs", ":FzfLua lsp_document_symbols<cr>")

		-- Get client instance
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end

		snippets.start_lsp_server()

		-- Auto formatting
		if client:supports_method("textDocument/formatting") then
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
				end,
			})
		end
	end,
})
