return {
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").add({
				-- Code actions
				{ "<Tab>", "<CMD>FzfLua lsp_code_actions<CR>", desc = "Code actions" },
				{ "-", "<CMD>Oil<CR>", desc = "Open oil" },

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

				-- Movement
				--- Move cursor
				{ "<C-h>", "<C-w>h", desc = "Cursor move left" },
				{ "<C-j>", "<C-w>j", desc = "Cursor move down" },
				{ "<C-k>", "<C-w>k", desc = "Cursor move up" },
				{ "<C-l>", "<C-w>l", desc = "Cursor move right" },

				--- Swap buf
				{ "<Leader><C-h>", "<C-w>H", desc = "Swap left" },
				{ "<Leader><C-j>", "<C-w>J", desc = "Swap down" },
				{ "<Leader><C-k>", "<C-w>K", desc = "Swap up" },
				{ "<Leader><C-l>", "<C-w>L", desc = "Swap right" },

				-- Move selection
				{
					mode = "v",
					{ "<", "<gv", desc = "Move selection left" },
					{ ">", ">gv", desc = "Move selection right" },
				},
			})
		end,
	},
}
