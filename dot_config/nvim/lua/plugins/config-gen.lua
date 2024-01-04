return function()
	local gen = require("gen")

	gen.model = "codellama"

	gen.prompts["Write_Tests"] = {
		prompt = "Implement tests for the following code.\n\nCode:\n```$filetype\n$register\n```\n\nTests:\n```$filetype",
		replace = true,
	}

	gen.prompts["Optimize_Code"] = {
		prompt = "Optime the following code.\n\nCode:\n```$filetype\n$text\n```\nOptimed version:\n```$filetype",
		replace = true,
		extract = "(.-)```",
	}
end
