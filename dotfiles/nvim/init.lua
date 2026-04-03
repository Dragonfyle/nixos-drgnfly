-- vim.lsp.set_log_level("debug")
-- always set leader first!
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-------------------------------------------------------------------------------
--
-- server mode
--
-- ----------------------------------------------------------------------------
--local pipepath = vim.fn.stdpath("cache") .. "/server.pipe"
--if not vim.loop.fs_stat(pipepath) then
--	vim.fn.serverstart(pipepath)
--end
-------------------------------------------------------------------------------
--
-- configuring diagnostics
--
-------------------------------------------------------------------------------
-- Allow virtual text
vim.diagnostic.config({ virtual_text = true, virtual_lines = false })

-------------------------------------------------------------------------------
--
-- preferences
--
-------------------------------------------------------------------------------
vim.keymap.set("n", "<C-k>", "<Nop>", { silent = true })
-- disable mouse
vim.opt.mouse = ""

-- never ever folding
vim.opt.foldenable = false
vim.opt.foldmethod = "manual"
vim.opt.foldlevelstart = 99

-- very basic "continue indent" mode (autoindent) is always on in neovim
-- could try smartindent/cindent, but meh.
-- vim.opt.cindent = true
-- XXX
-- vim.opt.cmdheight = 2
-- vim.opt.completeopt = 'menuone,noinsert,noselect'
-- not setting updatedtime because I use K to manually trigger hover effects
-- and lowering it also changes how frequently files are written to swap.
-- vim.opt.updatetime = 300
-- if key combos seem to be "lagging"
-- http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
-- vim.opt.timeoutlen = 300

-- keep more context on screen while scrolling
vim.opt.scrolloff = 2

-- never show me line breaks if they're not there
vim.opt.wrap = false

-- always draw sign column. prevents buffer moving when adding/deleting sign
vim.opt.signcolumn = "yes"

-- sweet sweet relative line numbers
vim.opt.relativenumber = true

-- and show the absolute line number for the current line
vim.opt.number = true

-- keep current content top + left when splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- infinite undo!
-- NOTE: ends up in ~/.local/state/nvim/undo/
vim.opt.undofile = true

--" Decent wildmenu
-- in completion, when there is more than one match,
-- list all matches, and only complete to longest common match
vim.opt.wildmode = "list:longest"

-- when opening a file with a command (like :e),
-- don't suggest files like there:
vim.opt.wildignore = ".hg,.svn,*~,*.png,*.jpg,*.gif,*.min.js,*.swp,*.o,vendor,dist,_site"

-- tabs: go big or go home
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = false
vim.g.editorconfig = false

-- case-insensitive search/replace
vim.opt.ignorecase = true

-- unless uppercase in search term
vim.opt.smartcase = true

-- never ever make my terminal beep
vim.opt.vb = true

-- more useful diffs (nvim -d)
--- by ignoring whitespace
vim.opt.diffopt:append("iwhite")

--- and using a smarter algorithm
--- https://vimways.org/2018/the-power-of-diff/
--- https://stackoverflow.com/questions/32365271/whats-the-difference-between-git-diff-patience-and-git-diff-histogram
--- https://luppeng.wordpress.com/2020/10/10/when-to-use-each-of-the-git-diff-algorithms/
vim.opt.diffopt:append("algorithm:histogram")
vim.opt.diffopt:append("indent-heuristic")

-- show a column at 80 characters as a guide for long lines
--vim.opt.colorcolumn = '80'

--- except in Rust where the rule is 100 characters
--vim.api.nvim_create_autocmd('Filetype', { pattern = 'rust', command = 'set colorcolumn=100' })
--
-- show more hidden characters
-- also, show tabs nicer
vim.opt.listchars = "tab:^ ,nbsp:¬,extends:»,precedes:«,trail:•"

-------------------------------------------------------------------------------
--
-- hotkeys
--
-------------------------------------------------------------------------------
-- quick-open,
--vim.keymap.set('', '<C-p>', '<cmd>Files<cr>')
-- search buffers
--vim.keymap.set('n', '<leader>;', '<cmd>Buffers<cr>')
-- quick-save
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")

-- make missing : less annoying
vim.keymap.set("n", ";", ":")
vim.keymap.set("v", ";", ":")

-- Ctrl+j as Esc (<C-c> for command-line mode due to terminal limitations)
vim.keymap.set({ "n", "i", "v", "s", "x", "o", "l", "t" }, "<C-j>", "<Esc>")
-- Ctrl-j is a little awkward unfortunately:
-- https://github.com/neovim/neovim/issues/5916
-- So we map c-j as c-c for commands
vim.keymap.set("c", "<C-j>", "<C-c>")
-- Ctrl+h to stop searching
vim.keymap.set("n", "<C-h>", "<cmd>nohlsearch<cr><cmd>match NONE<cr>")
vim.keymap.set("v", "<C-h>", "<cmd>nohlsearch<cr><cmd>match NONE<cr>")

-- Jump to start and end of line using the home row keys
vim.keymap.set("", "H", "^")
vim.keymap.set("", "L", "$")

-- paste clipboard into buffer
vim.keymap.set("n", "<leader>ps", '"+p')
vim.keymap.set("v", "<leader>ps", '"+p')

-- open new line below and paste clipboard
vim.keymap.set("n", "<leader>pgs", 'o<Esc>"+p')

-- copy entire selection into clipboard
vim.keymap.set("v", "<leader>ys", '"+y')

-- copy current file name to clipboard
vim.keymap.set("n", "<leader>yf", function()
	local filename = vim.fn.expand("%")
	vim.fn.setreg("+", filename)
	print("Copied filename: " .. filename)
end)

-- <leader><leader> toggles between buffers
vim.keymap.set("n", "<leader><leader>", "<c-^>")

-- <leader>, shows/hides hidden characters
vim.keymap.set("n", "<leader>,", ":set invlist<cr>")

-- always center search results
vim.keymap.set("n", "n", "nzz", { silent = true })
vim.keymap.set("n", "N", "Nzz", { silent = true })
vim.keymap.set("n", "*", "*zz", { silent = true })
vim.keymap.set("n", "#", "#zz", { silent = true })
vim.keymap.set("n", "g*", "g*zz", { silent = true })
vim.keymap.set("n", "<C-o>", "<C-o>zz", { silent = true })
vim.keymap.set("n", "<C-i>", "<C-i>zz", { silent = true })

-- "very magic" (less escaping needed) regexes by default
vim.keymap.set("n", "?", "?\\v")
vim.keymap.set("n", "/", "/\\v")
vim.keymap.set("c", "s/", "sm/")
vim.keymap.set("c", "%s/", "%sm/")

-- open new file adjacent to current file
-- vim.keymap.set('n', '<leader>o', ':e <C-R>=expand("%:p:h") . "/" <cr>')

-- no arrow keys --- force yourself to use the home row
vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")
vim.keymap.set("i", "<up>", "<nop>")
vim.keymap.set("i", "<down>", "<nop>")
vim.keymap.set("i", "<left>", "<nop>")
vim.keymap.set("i", "<right>", "<nop>")

-- let the left and right arrows be useful: they can switch buffers
vim.keymap.set("n", "<left>", ":bp<cr>")
vim.keymap.set("n", "<C-M-h>", ":bp<cr>")
vim.keymap.set("n", "<right>", ":bn<cr>")
vim.keymap.set("n", "<C-M-l>", ":bn<cr>")

-- make j and k move by visual line, not actual line, when text is soft-wrapped
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- handy keymap for replacing up to next _ (like in variable names)
vim.keymap.set("n", "<leader>m", "ct_")

-- comment toggle
vim.keymap.set("n", "<C-l>", "gcc", { remap = true })
vim.keymap.set("v", "<C-l>", "gc", { remap = true })

-- delete buffer
vim.keymap.set("n", "<Leader>q", ":bd<CR>")

-- newline and stay in normal mode
vim.keymap.set("n", "go", "o<Esc>")

-- yank without newlines
vim.keymap.set("n", "gyy", "^vg_y")

-- Jump to the next conflict marker
vim.keymap.set("n", "]n", function()
	vim.fn.search("^=======", "W")
end, { desc = "Jump to next git conflict marker" })

-- Jump to the previous conflict marker
vim.keymap.set("n", "[n", function()
	vim.fn.search("^=======", "bW")
end, { desc = "Jump to previous git conflict marker" })

-- toggle between true and false
vim.keymap.set("n", "<leader>tf", function()
	local word = vim.fn.expand("<cword>")
	if word == "true" then
		vim.cmd("normal! ciwfalse")
	elseif word == "false" then
		vim.cmd("normal! ciwtrue")
	else
		print("Current word is not true or false")
	end
end, { noremap = true, silent = true })

-- save and load last session (worktree-specific)
local function get_session_file()
	local result = vim.fn.systemlist({ "git", "rev-parse", "--show-toplevel" })
	local root_dir = (vim.v.shell_error == 0 and result[1]) or vim.fn.getcwd()
	local session_name = vim.fn.substitute(root_dir, "/", "_", "g")
	return vim.fn.expand("~/.config/nvim/sessions/") .. session_name .. ".vim"
end

vim.keymap.set("n", "<leader>s", function()
	local session_file = get_session_file()
	vim.fn.mkdir(vim.fn.expand("~/.config/nvim/sessions/"), "p")
	vim.cmd("mksession! " .. vim.fn.fnameescape(session_file))
	print("Session saved: " .. session_file)
end, { desc = "Save project session" })

vim.keymap.set("n", "<leader>l", function()
	local session_file = get_session_file()
	if vim.fn.filereadable(session_file) == 1 then
		vim.cmd("source " .. vim.fn.fnameescape(session_file))
		print("Session loaded: " .. session_file)
	else
		print("No session found for this project: " .. session_file)
	end
end, { desc = "Load project session" })

-- run currently hovered over test in Rust
vim.keymap.set("n", "<leader>t", ":RustTest -- --nocapture<CR>")

-- highlight word under cursor (case insensitive)
vim.keymap.set("n", "<leader>h", function()
	local word = vim.fn.expand("<cword>")
	local escaped = vim.fn.escape(word, "/\\^$.*[]~")
	vim.cmd("match MatchHighlight /\\c\\<" .. escaped .. "\\>/")
end)

-- highlight visual selection (case insensitive, partial match)
vim.keymap.set("v", "<leader>h", function()
	local region = vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), { type = vim.fn.mode() })
	local selected = table.concat(region, "\\n")
	local escaped = vim.fn.escape(selected, "/\\^$.*[]~")
	vim.cmd("match MatchHighlight /\\c" .. escaped .. "/")
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
end)
vim.keymap.set("i", "<C-M-m>", "<CR><ESC>O")

-- jump to test module (rust)
vim.keymap.set("n", "<Leader>ttm", function()
	local line_num = vim.fn.search("mod tests {", "w")
	if line_num == 0 then
		print("no tests module found")
	else
		vim.cmd("normal! zz")
	end
end, { desc = "jumps to tests module in current buffer" })

-------------------------------------------------------------------------------
--
-- autocommands
--
-------------------------------------------------------------------------------
-- cd to git worktree root when opening a file
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		local root = vim.fs.root(0, ".git") or vim.fs.root(vim.fn.getcwd(), ".git")
		if root then
			vim.cmd.cd(root)
		end
	end,
})

-- disable syntax highlighting for rust
-- vim.api.nvim_create_autocmd('FileType', {
-- 	pattern = 'rust',
-- 	callback = function()
-- 		vim.cmd('syntax off')
-- 	end,
-- })

-- highlight yanked text + strip trailing newline from clipboard yanks
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 500 })

		if vim.v.event.regname == "+" then
			local content = vim.fn.getreg("+")
			vim.fn.setreg("+", content:gsub("\n$", ""))
		end
	end,
})
-- jump to last edit position on opening file
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function(ev)
		if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
			-- except for in git commit messages
			-- https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
			if not vim.fn.expand("%:p"):find(".git", 1, true) then
				vim.cmd('exe "normal! g\'\\""')
			end
		end
	end,
})
-- prevent accidental writes to buffers that shouldn't be edited
vim.api.nvim_create_autocmd("BufRead", { pattern = "*.orig", command = "set readonly" })
vim.api.nvim_create_autocmd("BufRead", { pattern = "*.pacnew", command = "set readonly" })
-- leave paste mode when leaving insert mode (if it was on)
vim.api.nvim_create_autocmd("InsertLeave", { pattern = "*", command = "set nopaste" })
-- help filetype detection (add as needed)
--vim.api.nvim_create_autocmd('BufRead', { pattern = '*.ext', command = 'set filetype=someft' })
-- correctly classify mutt buffers
local email = vim.api.nvim_create_augroup("email", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "/tmp/mutt*",
	group = email,
	command = "setfiletype mail",
})
-- also, produce "flowed text" wrapping
-- https://brianbuccola.com/line-breaks-in-mutt-and-vim/
vim.api.nvim_create_autocmd("Filetype", {
	pattern = "mail",
	group = email,
	command = "setlocal formatoptions+=w",
})
-- shorter columns in text because it reads better that way
local text = vim.api.nvim_create_augroup("text", { clear = true })
for _, pat in ipairs({ "text", "markdown", "mail", "gitcommit" }) do
	vim.api.nvim_create_autocmd("Filetype", {
		pattern = pat,
		group = text,
		command = "setlocal spell tw=72 colorcolumn=73",
	})
end
--- tex has so much syntax that a little wider is ok
vim.api.nvim_create_autocmd("Filetype", {
	pattern = "tex",
	group = text,
	command = "setlocal spell tw=80 colorcolumn=81",
})
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

--autoclose quickfix after selection
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.keymap.set("n", "<CR>", "<CR><cmd>cclose<CR>", { buffer = true, silent = true })
	end,
})

-- maplocalleader for plugins like Octo
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{
			"sainnhe/gruvbox-material",
			lazy = false,
			priority = 1000,
			config = function()
				vim.cmd([[colorscheme gruvbox-material]])
				vim.g.gruvbox_material_better_performance = 1
				vim.g.gruvbox_material_background = "hard"
				-- Make it clearly visible which argument we're at.
				local marked = vim.api.nvim_get_hl(0, { name = "PMenu" })
				vim.api.nvim_set_hl(
					0,
					"LspSignatureActiveParameter",
					{ fg = marked.fg, bg = marked.bg, ctermfg = marked.ctermfg, ctermbg = marked.ctermbg, bold = true }
				)
				-- Purple stdout messages
				vim.api.nvim_set_hl(0, "MsgArea", { fg = "#d3869b" })
			end,
		},
		{
			"itchyny/lightline.vim",
			lazy = false, -- also load at start since it's UI
			config = function()
				vim.opt.runtimepath:prepend(vim.fn.expand("~/.config/lightline"))
				-- no need to also show mode in cmd line when we have bar
				vim.o.showmode = false
				vim.g.lightline = {
					colorscheme = "gruvbox",
					active = {
						left = {
							{ "paddedmode", "paste" },
							{ "readonly", "filename", "modified", "gitbranch" },
						},
						right = {
							{ "lineinfo" },
							{ "percent" },
							{ "fileencoding", "filetype" },
						},
					},
					component_function = {
						filename = "LightlineFilename",
						gitbranch = "FugitiveHead",
						paddedmode = "LightlinePaddedMode",
					},
				}
				function LightlineFilenameInLua(opts)
					if vim.fn.expand("%:t") == "" then
						return "[No Name]"
					else
						return vim.fn.getreg("%")
					end
				end

				-- https://github.com/itchyny/lightline.vim/issues/657
				vim.api.nvim_exec(
					[[
					function! g:LightlineFilename()
						return v:lua.LightlineFilenameInLua()
					endfunction
					function! g:LightlinePaddedMode()
						return '  ' . lightline#mode() . '  '
					endfunction
					]],
					true
				)
			end,
		},
		-- git integration
		"tpope/vim-fugitive",
		{
			"pwntester/octo.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
				-- "ibhagwan/fzf-lua",
				-- "nvim-telescope/telescope.nvim",
				"folke/snacks.nvim",
				"nvim-tree/nvim-web-devicons",
			},
			config = function()
				require("octo").setup({
					picker = "snacks",
					users = "assignable",
					enable_builtin = true,
					default_remote = { "origin" },
					default_to_projects_v2 = true,
					pull_requests = {
						delete_on_merge = true,
					},
					mappings = {
						submit_win = {
							approve_review = { lhs = "<C-s>", desc = "approve review" },
							comment_review = { lhs = "<C-m>", desc = "comment review" },
							request_changes = { lhs = "<C-r>", desc = "request changes review" },
							close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
						},
						review_thread = {
							goto_issue = { lhs = "<localleader>oogi", desc = "navigate to a local repo issue" },
							add_comment = { lhs = "<localleader>ooca", desc = "add comment" },
							add_suggestion = { lhs = "<localleader>oosa", desc = "add suggestion" },
							delete_comment = { lhs = "<localleader>oocd", desc = "delete comment" },
							next_comment = { lhs = "]c", desc = "go to next comment" },
							prev_comment = { lhs = "[c", desc = "go to previous comment" },
							select_next_entry = { lhs = "]q", desc = "move to next changed file" },
							select_prev_entry = { lhs = "[q", desc = "move to previous changed file" },
							select_first_entry = { lhs = "[Q", desc = "move to first changed file" },
							select_last_entry = { lhs = "]Q", desc = "move to last changed file" },
							close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
							react_hooray = { lhs = "<localleader>oorp", desc = "add/remove 🎉 reaction" },
							react_heart = { lhs = "<localleader>oorh", desc = "add/remove ❤️ reaction" },
							react_eyes = { lhs = "<localleader>oore", desc = "add/remove 👀 reaction" },
							react_thumbs_up = { lhs = "<localleader>oor+", desc = "add/remove 👍 reaction" },
							react_thumbs_down = { lhs = "<localleader>oor-", desc = "add/remove 👎 reaction" },
							react_rocket = { lhs = "<localleader>oorr", desc = "add/remove 🚀 reaction" },
							react_laugh = { lhs = "<localleader>oorl", desc = "add/remove 😄 reaction" },
							react_confused = { lhs = "<localleader>oorc", desc = "add/remove 😕 reaction" },
							resolve_thread = { lhs = "<localleader>oort", desc = "resolve PR thread" },
							unresolve_thread = { lhs = "<localleader>oorT", desc = "unresolve PR thread" },
						},
						issue = {
							close_issue = { lhs = "<localleader>ooic", desc = "close issue" },
							reopen_issue = { lhs = "<localleader>ooio", desc = "reopen issue" },
							list_issues = { lhs = "<localleader>ooil", desc = "list open issues on same repo" },
							reload = { lhs = "<C-r>", desc = "reload issue" },
							open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },
							copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
							add_assignee = { lhs = "<localleader>oaa", desc = "add assignee" },
							remove_assignee = { lhs = "<localleader>oad", desc = "remove assignee" },
							create_label = { lhs = "<localleader>olc", desc = "create label" },
							add_label = { lhs = "<localleader>ola", desc = "add label" },
							remove_label = { lhs = "<localleader>old", desc = "remove label" },
							goto_issue = { lhs = "<localleader>ogi", desc = "navigate to a local repo issue" },
							add_comment = { lhs = "<localleader>oca", desc = "add comment" },
							add_reply = { lhs = "<localleader>ocr", desc = "add reply" },
							delete_comment = { lhs = "<localleader>ocd", desc = "delete comment" },
							next_comment = { lhs = "]c", desc = "go to next comment" },
							prev_comment = { lhs = "[c", desc = "go to previous comment" },
							react_hooray = { lhs = "<localleader>orp", desc = "add/remove 🎉 reaction" },
							react_heart = { lhs = "<localleader>orh", desc = "add/remove ❤️ reaction" },
							react_eyes = { lhs = "<localleader>ore", desc = "add/remove 👀 reaction" },
							react_thumbs_up = { lhs = "<localleader>or+", desc = "add/remove 👍 reaction" },
							react_thumbs_down = { lhs = "<localleader>or-", desc = "add/remove 👎 reaction" },
							react_rocket = { lhs = "<localleader>orr", desc = "add/remove 🚀 reaction" },
							react_laugh = { lhs = "<localleader>orl", desc = "add/remove 😄 reaction" },
							react_confused = { lhs = "<localleader>orc", desc = "add/remove 😕 reaction" },
						},
						pull_request = {
							checkout_pr = { lhs = "<localleader>opo", desc = "checkout PR" },
							merge_pr = { lhs = "<localleader>opm", desc = "merge commit PR" },
							squash_and_merge_pr = { lhs = "<localleader>opsm", desc = "squash and merge PR" },
							rebase_and_merge_pr = { lhs = "<localleader>oprm", desc = "rebase and merge PR" },
							list_commits = { lhs = "<localleader>opc", desc = "list PR commits" },
							list_changed_files = { lhs = "<localleader>opf", desc = "list PR changed files" },
							show_pr_diff = { lhs = "<localleader>opd", desc = "show PR diff" },
							add_reviewer = { lhs = "<localleader>ova", desc = "add reviewer" },
							remove_reviewer = { lhs = "<localleader>ovd", desc = "remove reviewer request" },
							close_issue = { lhs = "<localleader>oic", desc = "close PR" },
							reopen_issue = { lhs = "<localleader>oio", desc = "reopen PR" },
							list_issues = { lhs = "<localleader>oil", desc = "list open issues on same repo" },
							reload = { lhs = "<C-r>", desc = "reload PR" },
							open_in_browser = { lhs = "<C-b>", desc = "open PR in browser" },
							copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
							goto_file = { lhs = "gf", desc = "go to file" },
							add_assignee = { lhs = "<localleader>oaa", desc = "add assignee" },
							remove_assignee = { lhs = "<localleader>oad", desc = "remove assignee" },
							create_label = { lhs = "<localleader>olc", desc = "create label" },
							add_label = { lhs = "<localleader>ola", desc = "add label" },
							remove_label = { lhs = "<localleader>old", desc = "remove label" },
							goto_issue = { lhs = "<localleader>ogi", desc = "navigate to a local repo issue" },
							add_comment = { lhs = "<localleader>oca", desc = "add comment" },
							delete_comment = { lhs = "<localleader>ocd", desc = "delete comment" },
							next_comment = { lhs = "]c", desc = "go to next comment" },
							prev_comment = { lhs = "[c", desc = "go to previous comment" },
							react_hooray = { lhs = "<localleader>orp", desc = "add/remove 🎉 reaction" },
							react_heart = { lhs = "<localleader>orh", desc = "add/remove ❤️ reaction" },
							react_eyes = { lhs = "<localleader>ore", desc = "add/remove 👀 reaction" },
							react_thumbs_up = { lhs = "<localleader>or+", desc = "add/remove 👍 reaction" },
							react_thumbs_down = { lhs = "<localleader>or-", desc = "add/remove 👎 reaction" },
							react_rocket = { lhs = "<localleader>orr", desc = "add/remove 🚀 reaction" },
							react_laugh = { lhs = "<localleader>orl", desc = "add/remove 😄 reaction" },
							react_confused = { lhs = "<localleader>orc", desc = "add/remove 😕 reaction" },
							review_start = { lhs = "<localleader>ovs", desc = "start a review for the current PR" },
							review_resume = {
								lhs = "<localleader>ovr",
								desc = "resume a pending review for the current PR",
							},
							resolve_thread = { lhs = "<localleader>ort", desc = "resolve PR thread" },
							unresolve_thread = { lhs = "<localleader>orT", desc = "unresolve PR thread" },
						},
					},
				})
			end,
			vim.keymap.set({ "n", "v" }, "<leader>o", "<cmd>Octo<cr>", {
				noremap = true,
				silent = true,
				desc = "Octo",
			}),
		},
		{
			"afonsofrancof/worktrees.nvim",
			event = "VeryLazy",
			opts = {
				-- Specify where to create worktrees relative to git common dir
				-- The common dir is the .git dir in a normal repo or the root dir of a bare repo
				base_path = "../worktrees/", -- Parent directory of common dir

				-- Template for worktree folder names
				-- This is only used if you don't specify the folder name when creating the worktree
				path_template = "{branch}", -- Default: use branch name

				-- Command names (optional)
				commands = {
					create = "WorktreeCreate",
					delete = "WorktreeDelete",
					switch = "WorktreeSwitch",
				},

				-- Key mappings for interactive UI (optional)
				mappings = {
					create = "<leader>vtc",
					delete = "<leader>vtd",
					switch = "<leader>vts",
				},
			},
		},
		-- quick navigation
		{
			"https://codeberg.org/andyg/leap.nvim",
			config = function()
				local clever_x = require("leap.user").with_traversal_keys("x", "X")
				vim.keymap.set({ "n", "x", "o" }, "x", function()
					require("leap").leap({ opts = clever_x })
				end)
				vim.keymap.set({ "n", "x", "o" }, "X", function()
					require("leap").leap({ backward = true, opts = clever_x })
				end)

				local function ft_args(key_specific_args)
					local common_args = {
						inputlen = 1,
						inclusive = true,
						opts = {
							labels = "",
							safe_labels = vim.fn.mode(1):match("[no]") and "" or nil,
						},
					}
					return vim.tbl_deep_extend("keep", common_args, key_specific_args)
				end

				local clever = require("leap.user").with_traversal_keys
				local clever_f = clever("f", "F")
				local clever_t = clever("t", "T")

				for key, args in pairs({
					f = { opts = clever_f },
					F = { backward = true, opts = clever_f },
					t = { offset = -1, opts = clever_t },
					T = { backward = true, offset = 1, opts = clever_t },
				}) do
					vim.keymap.set({ "n", "x", "o" }, key, function()
						require("leap").leap(ft_args(args))
					end)
				end
			end,
		},
		-- automatically insert closing braces
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = true,
			-- use opts = {} for passing setup options
			-- this is equivalent to setup({}) function
		},
		-- surround
		{
			"kylechui/nvim-surround",
			version = "*",
			event = "VeryLazy",
			config = true,
		},
		-- better %
		{
			"andymass/vim-matchup",
			config = function()
				vim.g.matchup_matchparen_offscreen = { method = "popup" }
				vim.g.matchup_matchparen_deferred = 1
			end,
		},
		-- snippet engine
		-- {
		-- 	"L3MON4D3/LuaSnip",
		-- 	-- follow latest release.
		-- 	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- 	-- install jsregexp (optional!).
		-- 	build = "make install_jsregexp",
		-- 	dependencies = { "rafamadriz/friendly-snippets" },
		--
		-- 	config = function()
		-- 		local ls = require("luasnip")
		-- 		require("luasnip.loaders.from_vscode").lazy_load()
		-- 		require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets/" })
		--
		-- 		vim.keymap.set({ "i" }, "<C-T>", function()
		-- 			ls.expand()
		-- 		end, { silent = true })
		-- 		vim.keymap.set({ "i", "s" }, "<C-L>", function()
		-- 			ls.jump(1)
		-- 		end, { silent = true })
		--
		-- 		vim.keymap.set({ "i", "s" }, "<C-E>", function()
		-- 			if ls.choice_active() then
		-- 				ls.change_choice(1)
		-- 			end
		-- 		end, { silent = true })
		-- 	end,
		-- },
		{
			"folke/snacks.nvim",
			priority = 1000,
			lazy = false,
			---@type snacks.Config
			opts = {
				picker = {
					enabled = true,
					layout = {
						layout = {
							width = 0.70,
							height = 0.70,
						},
					},
					sources = {
						files = {
							hidden = false,
							ignored = false,
							actions = {
								toggle_hidden = function(picker)
									picker.opts.hidden = not picker.opts.hidden
									picker:find()
								end,
								toggle_ignored = function(picker)
									picker.opts.ignored = not picker.opts.ignored
									picker:find()
								end,
							},
							win = {
								input = {
									keys = {
										["<c-r>"] = { "toggle_hidden", mode = { "i", "n" }, desc = "Toggle Hidden" },
										["<c-g>"] = { "toggle_ignored", mode = { "i", "n" }, desc = "Toggle Ignored" },
									},
								},
							},
						},
						grep = {
							hidden = false,
							ignored = false,
							actions = {
								toggle_hidden = function(picker)
									picker.opts.hidden = not picker.opts.hidden
									picker:find()
								end,
								toggle_ignored = function(picker)
									picker.opts.ignored = not picker.opts.ignored
									picker:find()
								end,
							},
							win = {
								input = {
									keys = {
										["<c-r>"] = { "toggle_hidden", mode = { "i", "n" }, desc = "Toggle Hidden" },
										["<c-g>"] = { "toggle_ignored", mode = { "i", "n" }, desc = "Toggle Ignored" },
									},
								},
							},
						},
					},
					win = {
						input = {
							keys = {
								["<c-j>"] = { "close", mode = { "i", "n" } },
								["<a-p>"] = { "history_back", mode = { "i", "n" } },
								["<a-n>"] = { "history_forward", mode = { "i", "n" } },
							},
						},
					},
				},
			},
			keys = {
				-- Top Pickers & Explorer
				{
					"<c-p>",
					function()
						Snacks.picker.smart({ cwd = vim.fn.getcwd(), filter = { cwd = true } })
					end,
					desc = "Smart Find Files",
				},
				{
					"<leader>;",
					function()
						Snacks.picker.buffers()
					end,
					desc = "Buffers",
				},
				{
					"<c-a-p>",
					function()
						Snacks.picker.grep({ cwd = vim.fn.getcwd() })
					end,
					desc = "Grep",
				},
				{
					"<leader>:",
					function()
						Snacks.picker.command_history()
					end,
					desc = "Command History",
				},
				{
					"<leader>pp",
					function()
						Snacks.picker.grep_word({ cwd = vim.fn.getcwd() })
					end,
					mode = { "n", "x" },
					desc = "Grep Word or Visual Selection",
				},
			},
		},
		-- fzf support for ^p
		-- {
		-- 	"ibhagwan/fzf-lua",
		-- 	lazy = false,
		-- 	-- optional for icon support
		-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
		-- 	config = function()
		-- 		local actions = require("fzf-lua.actions")
		-- 		-- calling `setup` is optional for customization
		-- 		function list_cmd()
		-- 			local base = vim.fn.fnamemodify(vim.fn.expand("%"), ":h:.:S")
		-- 			if base == "." then
		-- 				-- if there is no current file,
		-- 				-- proximity-sort can't do its thing
		-- 				return "fd --type file --follow"
		-- 			else
		-- 				return vim.fn.printf(
		-- 					"fd --type file --follow | proximity-sort %s",
		-- 					vim.fn.shellescape(vim.fn.expand("%"))
		-- 				)
		-- 			end
		-- 		end
		--
		-- 		local fzf_lua = require("fzf-lua")
		-- 		fzf_lua.register_ui_select()
		--
		-- 		fzf_lua.setup({
		-- 			defaults = {
		-- 				git_icons = false,
		-- 				file_icons = true,
		-- 				color_icons = true,
		-- 			},
		-- 			keymap = {
		-- 				fzf = {
		-- 					["alt-n"] = "next-history",
		-- 					["alt-p"] = "prev-history",
		-- 					["ctrl-p"] = "up",
		-- 					["ctrl-n"] = "down",
		-- 				},
		-- 			},
		-- 			winopts = {
		-- 				height = 0.55,
		-- 				width = 0.55,
		-- 				backdrop = 50,
		-- 			},
		-- 			fzf_history_dir = "~/.config/local/share/fzf-lua-history",
		-- 			files = {
		-- 				fzf_opts = {
		-- 					["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-files-history",
		-- 				},
		-- 				cwd_prompt = false,
		-- 				actions = {
		-- 					["ctrl-g"] = { actions.grep_lgrep },
		-- 					["ctrl-r"] = { actions.toggle_ignore },
		-- 				},
		-- 			},
		-- 			grep = {
		-- 				fzf_opts = {
		-- 					["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-grep-history",
		-- 				},
		-- 				actions = {
		-- 					-- actions inherit from 'actions.files' and merge
		-- 					-- this action toggles between 'grep' and 'live_grep'
		-- 					["ctrl-g"] = { actions.grep_lgrep },
		-- 					["ctrl-r"] = { actions.toggle_ignore },
		-- 				},
		-- 			},
		-- 		})
		-- 		vim.keymap.set("", "<c-a-p>", require("fzf-lua").live_grep, { desc = "Fzf Files" })
		-- 		vim.keymap.set("x", "<leader>pp", "<cmd>FzfLua grep_visual<CR>", { desc = "Grep" })
		-- 		vim.keymap.set("", "<C-p>", function()
		-- 			opts = {}
		-- 			opts.cmd = "fd --color=never --hidden --type f --type l --exclude .git"
		-- 			local base = vim.fn.fnamemodify(vim.fn.expand("%"), ":h:.:S")
		-- 			if base ~= "." then
		-- 				-- if there is no current file,
		-- 				-- proximity-sort can't do its thing
		-- 				opts.cmd = opts.cmd .. (" | proximity-sort %s"):format(vim.fn.shellescape(vim.fn.expand("%")))
		-- 			end
		-- 			opts.fzf_opts = {
		-- 				["--scheme"] = "path",
		-- 				["--tiebreak"] = "index",
		-- 				["--layout"] = "reverse",
		-- 			}
		-- 			require("fzf-lua").files(opts)
		-- 		end)
		-- 		vim.keymap.set("n", "<leader>;", function()
		-- 			require("fzf-lua").buffers({
		-- 				-- just include the paths in the fzf bits, and nothing else
		-- 				-- https://github.com/ibhagwan/fzf-lua/issues/2230#issuecomment-3164258823
		-- 				fzf_opts = {
		-- 					["--with-nth"] = "{-3..-2}",
		-- 					["--nth"] = "-1",
		-- 					["--delimiter"] = "[:\u{2002}]",
		-- 					["--header-lines"] = "false",
		-- 				},
		-- 				header = false,
		-- 			})
		-- 		end)
		-- 	end,
		-- },
		-- Conform - formatting
		{
			"stevearc/conform.nvim",
			config = function()
				require("conform").setup({
					formatters = {
						prettierd = {
							require_cwd = true,
						},
						gdformat = {
							args = { "$FILENAME" },
							stdin = false,
						},
					},
					formatters_by_ft = {
						lua = { "stylua" },
						-- Conform will run multiple formatters sequentially
						--python = { "isort", "black" },
						-- You can customize some of the format options for the filetype (:help conform.format)
						--rust = { "rustfmt", lsp_format = "fallback" },
						-- Conform will run the first available formatter
						javascript = { "prettierd" },
						javascriptreact = { "prettierd" },
						typescript = { "prettierd" },
						typescriptreact = { "prettierd" },
						astro = { "prettier" },
						gdscript = { "gdformat" },
					},
					format_on_save = {
						-- These options will be passed to conform.format()
						timeout_ms = 1000,
						lsp_format = "fallback",
					},
				})
			end,
		},
		-- undo tree
		{
			"jiaoshijie/undotree",
			keys = { -- load the plugin only when using it's keybinding:
				{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
			},
			config = function()
				require("undotree").setup({
					float_diff = true, -- using float window previews diff, set this `true` will disable layout option
					layout = "left_bottom", -- "left_bottom", "left_left_bottom"
					position = "left", -- "right", "bottom"
					ignore_filetype = {
						"undotree",
						"undotreeDiff",
						"qf",
					},
					window = {
						winblend = 0,
						border = "rounded", -- The string values are the same as those described in 'winborder'.
					},
					keymaps = {
						j = "move_next",
						k = "move_prev",
						gj = "move2parent",
						J = "move_change_next",
						K = "move_change_prev",
						["<cr>"] = "action_enter",
						p = "enter_diffbuf",
						q = "quit",
					},
				})
			end,
		},
		-- dap (debug adapter protocol)
		{
			"mfussenegger/nvim-dap",
			config = function()
				local dap = require("dap")
				dap.adapters.godot = {
					type = "server",
					host = "127.0.0.1",
					port = 6006,
				}

				dap.configurations.gdscript = {
					{
						type = "godot",
						request = "launch",
						name = "Launch scene",
						project = "${workspaceFolder}",
						launch_scene = true,
					},
				}
			end,
		},
		-- sorting tailwind classes
		{
			"laytan/tailwind-sorter.nvim",
			dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
			build = "cd formatter && npm ci && npm run build",
			config = true,
		},
		-- Mason
		{
			"williamboman/mason.nvim",
			lazy = false,
			config = function()
				require("mason").setup({
					ensure_installed = {
						"astro-language-server",
						"clangd",
						"docker-compose-language-service",
						"dockerfile-language-server",
						"eslint-lsp",
						"fish-lsp",
						"intelephense",
						"laravel-ls",
						"lua-language-server",
						"pyright",
						"stylua",
						"tailwindcss-language-server",
						"vtsls",
						"vue-language-server",
						"yaml-language-server",
					},
				})
			end,
		},
		-- Mason lsp config
		{
			"williamboman/mason-lspconfig.nvim",
			lazy = false,
			config = function()
				require("mason-lspconfig").setup({})
			end,
		},
		-- LSP
		{
			"neovim/nvim-lspconfig",
			lazy = false,
			config = function()
				-- Setup language servers.
				--C
				vim.lsp.config.clangd = {}

				--TypeScript
				vim.lsp.config.vtsls = {
					settings = {
						typescript = {
							preferences = {
								includePackageJsonAutoImports = "on",
							},
							inlayHints = {
								parameterNames = { enabled = "all" },
								parameterTypes = { enabled = true },
								variableTypes = { enabled = true },
								propertyDeclarationTypes = { enabled = true },
								functionLikeReturnTypes = { enabled = true },
								enumMemberValues = { enabled = true },
							},
						},
						vtsls = {
							experimental = {
								completion = {
									enableServerSideFuzzyMatch = true,
								},
							},
						},
					},
				}

				--GDScript
				vim.lsp.config.gdscript = {
					name = "godot",
					cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
				}

				--Tailwind
				vim.lsp.config.tailwindcss = {}

				--Vue
				vim.lsp.config.vuels = {}

				--Astro
				vim.lsp.config.astro = {}

				--eslint
				vim.lsp.config.eslint = {}

				--python
				vim.lsp.enable("pyright")

				--Lua
				vim.lsp.config("lua_ls", {
					on_init = function(client)
						if client.workspace_folders then
							local path = client.workspace_folders[1].name
							if
								path ~= vim.fn.stdpath("config")
								and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
							then
								return
							end
						end

						client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
							runtime = {
								-- Tell the language server which version of Lua you're using (most
								-- likely LuaJIT in the case of Neovim)
								version = "LuaJIT",
								-- Tell the language server how to find Lua modules same way as Neovim
								-- (see `:h lua-module-load`)
								path = {
									"lua/?.lua",
									"lua/?/init.lua",
								},
							},
							-- Make the server aware of Neovim runtime files
							workspace = {
								checkThirdParty = false,
								library = {
									vim.env.VIMRUNTIME,
									vim.fn.stdpath("data") .. "/lazy",
									-- Depending on the usage, you might want to add additional paths
									-- here.
									-- '${3rd}/luv/library'
									-- '${3rd}/busted/library'
								},
								-- Or pull in all of 'runtimepath'.
								-- NOTE: this is a lot slower and will cause issues when working on
								-- your own configuration.
								-- See https://github.com/neovim/nvim-lspconfig/issues/3189
								-- library = {
								--   vim.api.nvim_get_runtime_file('', true),
								-- }
							},
						})
					end,
					settings = {
						Lua = {},
					},
				})

				--PHP
				vim.lsp.config.intelephense = {}

				--Laravel
				vim.lsp.config.laravel_ls = {}

				--Fish
				vim.lsp.config.fish_lsp = {}

				--YAML
				vim.lsp.config.yamlls = {}

				-- Bash LSP
				if vim.fn.executable("bash-language-server") == 1 then
					vim.lsp.config.bashls = {
						cmd = { "bash-language-server", "start" },
						filetypes = { "sh" },
						root_dir = require("lspconfig").util.find_git_ancestor,
					}
					vim.lsp.enable("bashls")
				end

				vim.lsp.enable({
					"gdscript",
					"tailwindcss",
					"dockerls",
				})

				-- Global mappings.
				-- See `:help vim.diagnostic.*` for documentation on any of the below functions
				vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
				-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

				-- Use LspAttach autocommand to only map the following keys
				-- after the language server attaches to the current buffer
				vim.api.nvim_create_autocmd("LspAttach", {
					group = vim.api.nvim_create_augroup("UserLspConfig", {}),
					callback = function(ev)
						-- Enable completion triggered by <c-x><c-o>
						vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

						-- Buffer local mappings.
						-- See `:help vim.lsp.*` for documentation on any of the below functions
						local opts = { buffer = ev.buf }
						vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
						vim.keymap.set("n", "gd", function()
							vim.lsp.buf.definition()
							vim.defer_fn(function()
								vim.cmd("normal! zz")
							end, 40)
						end, opts)
						vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
						vim.keymap.set("n", "gi", function()
							vim.lsp.buf.implementation()
							vim.defer_fn(function()
								vim.cmd("normal! zz")
							end, 40)
						end, opts)
						vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
						vim.keymap.set("n", "<leader>llwa", vim.lsp.buf.add_workspace_folder, opts)
						vim.keymap.set("n", "<leader>llwr", vim.lsp.buf.remove_workspace_folder, opts)
						vim.keymap.set("n", "<leader>llwl", function()
							print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
						end, opts)
						vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts)
						vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
						vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
						vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
						vim.keymap.set("n", "<leader>f", function()
							vim.lsp.buf.format({ async = true })
						end, opts)

						-- Disable inlay hints
						vim.lsp.inlay_hint.enable(false, { bufnr = ev.buf })

						-- None of this semantics tokens business.
						-- https://www.reddit.com/r/neovim/comments/143efmd/is_it_possible_to_disable_treesitter_completely/
						-- client.server_capabilities.semanticTokensProvider = nil
					end,
				})
			end,
		},
		-- LSP-based code-completion
		{
			"hrsh7th/nvim-cmp",
			-- load cmp on InsertEnter
			event = "InsertEnter",
			-- these dependencies will only be loaded when cmp loads
			-- dependencies are always lazy-loaded unless specified otherwise
			dependencies = {
				"neovim/nvim-lspconfig",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				-- "saadparwaiz1/cmp_luasnip",
			},
			config = function()
				local cmp = require("cmp")
				cmp.setup({
					mapping = cmp.mapping.preset.insert({
						["<c-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
						["<c-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
						["<C-b>"] = cmp.mapping.scroll_docs(-4),
						["<C-f>"] = cmp.mapping.scroll_docs(4),
						["<A-Space>"] = cmp.mapping.complete(),
						["<C-e>"] = cmp.mapping.abort(),
						-- Accept currently selected item.
						-- Set `select` to `false` to only confirm explicitly selected items.
						["<CR>"] = cmp.mapping.confirm({ select = true }),
					}),
					sources = cmp.config.sources({
						{ name = "nvim_lsp" },
						-- { name = "luasnip" },
					}, {
						{ name = "path" },
					}),
					experimental = {
						ghost_text = true,
					},
				})

				-- Enable completing paths in :
				cmp.setup.cmdline(":", {
					sources = cmp.config.sources({
						{ name = "path" },
					}),
				})
			end,
		},
		-- inline function signatures
		{
			"ray-x/lsp_signature.nvim",
			event = "VeryLazy",
			opts = {},
			config = function(_, opts)
				require("lsp_signature").setup({
					doc_lines = 10,
					handler_opts = {
						border = "none",
					},
					hint_prefix = {
						above = "↙ ", -- when the hint is on the line above the current line
						current = "← ", -- when the hint is on the same line
						below = "↖ ", -- when the hint is on the line below the current line
					},
				})
			end,
		},
		-- language support
		-- terraform
		{
			"hashivim/vim-terraform",
			ft = { "terraform" },
		},
		-- svelte
		{
			"evanleck/vim-svelte",
			ft = { "svelte" },
		},
		-- toml
		"cespare/vim-toml",
		-- yaml
		{
			"cuducos/yaml.nvim",
			ft = { "yaml" },
			dependencies = {
				"nvim-treesitter/nvim-treesitter",
			},
		},
		{
			"mrcjkb/rustaceanvim",
			lazy = false, -- This plugin is already lazy
			ft = { "rust" },
			init = function()
				vim.g.rustaceanvim = {
					tools = {
						code_actions = {
							ui_select_fallback = true,
						},
						enable_clippy = true,
					},
					server = {
						-- custom rust analyzer
						-- cmd = { "/home/michal/code/rust-analyzer-fork/target/debug/rust-analyzer" },
						on_attach = function(_, bufnr)
							vim.keymap.set("n", "K", function()
								vim.cmd.RustLsp({ "hover", "actions" })
							end, { silent = true, buffer = bufnr })
						end,
						settings = {
							["rust-analyzer"] = {
								checkOnSave = true,
								cargo = {
									allFeatures = true,
									low_priority = true,
								},
								check = {
									command = "clippy",
									extraArgs = {
										"--",
										"-W",
										"clippy::all",
										"-W",
										"clippy::pedantic",
										"-W",
										"clippy::nursery",
									},
								},
								tools = {},
								imports = {
									group = {
										enable = false,
									},
								},
								completion = {
									postfix = {
										enable = false,
									},
								},
								procMacro = {
									attributes = { enable = true },
									enable = true,
								},
								inlayHints = {
									chainingHints = {
										enable = true,
									},
									closureReturnTypeHints = {
										enable = true,
									},
									expressionAdjustmentHints = {
										enable = true,
									},

									typeHints = {
										enable = true,
									},
								},
							},
						},
					},
				}
				vim.keymap.set("n", "<leader>rrm", function()
					vim.cmd.RustLsp({ "view", "mir" })
				end, { desc = "RustLsp View MIR", noremap = true, silent = true })
				vim.keymap.set("n", "<leader>rrh", function()
					vim.cmd.RustLsp({ "view", "hir" })
				end, { desc = "RustLsp View HIR", noremap = true, silent = true })
				vim.keymap.set("n", "<leader>rrt", function()
					vim.cmd.RustLsp("testables")
				end)
			end,
		},
		{
			"nvim-neotest/neotest",
			dependencies = {
				"nvim-neotest/nvim-nio",
				"nvim-lua/plenary.nvim",
				"antoinemadec/FixCursorHold.nvim",
				"nvim-treesitter/nvim-treesitter",
			},
			config = function()
				require("neotest").setup({
					adapters = {
						require("rustaceanvim.neotest"),
					},
				})
				vim.keymap.set("n", "<leader>ttr", function()
					require("neotest").run.run()
				end, { desc = "Run nearest test" })
			end,
		},
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true, notify = false },
})

-- add custom highlights (must be after colorscheme)
local gruvbox_accent = { bg = "#d7bca5", fg = "#1d2021" }
vim.api.nvim_set_hl(0, "MatchHighlight", gruvbox_accent)
vim.api.nvim_set_hl(0, "YankHighlight", gruvbox_accent)
