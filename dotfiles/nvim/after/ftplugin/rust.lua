local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "<leader>ca", function()
	vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
	-- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })

vim.keymap.set("v", "<leader>ca", ":RustLsp codeAction<CR>", { silent = true, buffer = bufnr })


require("nvim-surround").buffer_setup({
	surrounds = {
		["d"] = {
			add = { "dbg!(", ")" },
			find = "dbg!%b()",
			delete = "^(dbg!%()().-(%))()$",
		},
	},
})
