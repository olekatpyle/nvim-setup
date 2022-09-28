require("xunit").setup({
	command = {
		-- perform 'dotnet clean' default true
		clean = true,
		-- change the verobsity level of the test log: [m]inimal | [n]ormal | [d]etailed | [diag]nostic
		-- defaults to minimal. (See dotnet test --help)
		-- NOTE: more detailed logs may have impact on performance
		verbosity = "m",
		-- add additional arguements to dotnet [t]est (see dotnet test --help for all options)
		targs = {},
		-- add additional arguments to dotnet [c]lean (see dotnet clean --help for all options)
		cargs = {},
	},
	-- change the virt_text annotation text displayed in the file
	virt_text = {
		idle = "Run test",
		running = "Running...",
		passed = " Passed!",
		failed = " Failed!",
		inln_passed = "",
		inln_failed = "",
	},
	-- set border for popup and test log window
	border = { "┌", "─", "┐", "└", "┘", "│" },
	notify = true,
})
