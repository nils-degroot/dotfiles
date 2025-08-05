vim.o.number = true
vim.o.relativenumber = true
vim.o.linebreak = true
vim.o.winborder = "rounded"
vim.o.signcolumn = "yes"

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.scrolloff = 5
vim.opt.termguicolors = true

require('bar')

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
		vim.highlight.on_yank({ timeout = 500 })
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
vim.keymap.set("n", "<leader>cf", ":FzfLua live_grep<cr>")
vim.keymap.set("n", "<leader>h", ":FzfLua helptags<cr>")

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function()
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = true })
		vim.keymap.set("n", "<leader>sd", vim.lsp.buf.hover, { buffer = true })
		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = true })

		vim.keymap.set("n", "<tab>", ":FzfLua lsp_code_actions<cr>")
		vim.keymap.set("n", "<leader>cw", ":FzfLua lsp_workspace_diagnostics<cr>")
	end
})

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

	-- Ui
	"https://github.com/folke/todo-comments.nvim",

	-- Programming
	"https://github.com/mrcjkb/rustaceanvim",

	-- Sql
	"https://github.com/tpope/vim-dadbod",
	"https://github.com/kristijanhusak/vim-dadbod-ui",
	"https://github.com/kristijanhusak/vim-dadbod-completion",
})

-- Lsping
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		-- Get client instance
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end

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

vim.diagnostic.config({ virtual_text = true })
vim.lsp.inlay_hint.enable()

require("oil").setup({
	columns = {
		"icon",
		"mtime",
	},
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
})
vim.cmd("FzfLua register_ui_select")

require("nvim-treesitter.configs").setup({
	ensure_installed = { "rust", "nu", "lua" },
	highlight = { enable = true }
})

require("todo-comments").setup({})

vim.cmd("color srcery")

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
	filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})

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
