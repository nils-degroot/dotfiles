local M = {}

local hop = require("hop")
local hop_hint = require("hop.hint")

local bc = { direction = hop_hint.HintDirection.BEFORE_CURSOR }
local ac = { direction = hop_hint.HintDirection.AFTER_CURSOR }

M.word_backward = function()
	hop.hint_words(bc)
end

M.word_forward = function()
	hop.hint_words(ac)
end

M.line_backward_start = function()
	hop.hint_lines(bc)
end

M.line_forwards_start = function()
	hop.hint_lines(ac)
end

M.line_backward = function()
	hop.hint_lines_skip_whitespace(bc)
end

M.line_forward = function()
	hop.hint_lines_skip_whitespace(ac)
end

M.find_backward = function()
	hop.hint_char1(bc)
end

M.find_forward = function()
	hop.hint_char1(ac)
end

return M
