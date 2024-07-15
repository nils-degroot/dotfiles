local set = vim.api.nvim_set_keymap

-- Util objects
local silent_noremap = { silent = true, noremap = true }

set("v", "<", "<gv", silent_noremap)
set("v", ">", ">gv", silent_noremap)

set("n", "<CR>", ":FzfLua lsp_code_actions<CR>", silent_noremap)
set("n", "-", ":Oil<CR>", silent_noremap)

require("which-key").add({
	-- Project
	{ "<Leader>pf", "<CMD>FzfLua files<CR>", desc = "Find file" },

	-- Toggle
	{ "<Leader>th", "<CMD>set invlist<CR>", desc = "Show hidden characters" },

	-- Code
	{ "<Leader>cr", "<CMD>Lspsaga rename<CR>", desc = "Rename element" },
	{ "<Leader>cc", "<CMD>noh<CR>", desc = "Clear selection" },
	{ "<Leader>cd", "<CMD>FzfLua diagnostics_document<CR>", desc = "Document diagnostics" },
	{ "<Leader>cw", "<CMD>FzfLua diagnostics_workspace<CR>", desc = "Workspace diagnostics" },
	{ "<Leader>cf", "<CMD>FzfLua live_grep<CR>", desc = "Live grep" },

	-- Goto
	{ "<Leader>gd", "<CMD>lua vim.lsp.buf.definition()<CR>", desc = "Goto definition" },
	{ "<Leader>gr", "<CMD>FzfLua lsp_references<CR>", desc = "Find references" },

	-- Show
	{ "<Leader>sd", "<CMD>Lspsaga peek_definition<CR>", desc = "Show definition" },
	{ "<Leader>ss", "<CMD>Lspsaga hover_doc<CR>", desc = "Show doc" },
	{ "<Leader>sc", "<CMD>FzfLua git_status<CR>", desc = "Show changes" },

	-- Buffer
	{ "<Leader>bb", "<CMD>FzfLua buffers<CR>", desc = "Buffers" },

	-- Notes
	{ "<Leader>nf", "<CMD>ObsidianSearch<CR>", desc = "Find notes" },
	{ "<Leader>nn", "<CMD>ObsidianNew new_note<CR>", desc = "New note" },
	{ "<Leader>nt", "<CMD>ObsidianTemplate<CR>", desc = "Insert template" },
	{ "<Leader>ngt", "<CMD>ObsidianToday<CR>", desc = "Goto today" },
})
