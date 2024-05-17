local fn = vim.fn
local opt = vim.opt

local undo_dir = fn.expand("~/.local/share/vim-undo")

if fn.has("persistent_undo") then
	if not fn.isdirectory(undo_dir) then
		os.execute("mkdir -p " .. undo_dir)
	end

	opt.undodir = undo_dir
	opt.undofile = true
end
