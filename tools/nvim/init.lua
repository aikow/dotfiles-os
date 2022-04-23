require("aiko.plugins")

local g = vim.g
local o, wo, bo = vim.o, vim.wo, vim.bo
local fn = vim.fn

local utils = require("aiko.utils")
local opt = utils.opt
local autocmd = utils.autocmd
local map = utils.map
local smap = utils.smap

-- Check the host operating system
if fn.has("win64") == 1 or fn.has("win32") == 1 or fn.has("win16") == 1 then
	g.os = "Windows"
else
	g.os = fn.substitute(fn.system("uname"), "\n", "", "")
end

-- =======================
-- |=====================|
-- ||                   ||
-- || Internal Settings ||
-- ||                   ||
-- |=====================|
-- =======================
--
-- Set runtimepath to the source files in the dotfiles directory
-- o.rtp = o.rtp .. "," .. fn.expand("~/.dotfiles/tools/nvim")

-- Don't need vi compatibility
o.compatible = false

-- make scrolling and painting fast
o.lazyredraw = true

-- use Unicode
o.encoding = "utf-8"

-- Search recursively downward from CWD; provides TAB completion for filenames
-- e.g., `:find vim* <TAB>`
o.path = o.path .. ",**"

-- Set working directory to the current files
o.autochdir = false

-- Number of lines at the beginning and end of files checked for file-specific vars
o.modelines = 3
o.modeline = true

-- make Backspace work like Delete
o.backspace = "indent,eol,start"

-- Permanent undo
o.undofile = true

-- Backups and Swap files
o.backup = false
o.swapfile = true

-- Automatically update buffer if modified outside of neovim.
o.autoread = true

-- Better display for messages
o.updatetime = 1000

-- open new buffers without saving current modifications (buffer remains open)
o.hidden = true

-- Set the timeout times
o.timeoutlen = 500
o.ttimeoutlen = 5

-- Use system clipboard
if g.os == "Darwin" then
	o.clipboard = "unnamed"
elseif g.os == "Linux" then
	o.clipboard = "unnamedplus"
elseif g.os == "Windows" then
end

-- Filetype plugins
vim.cmd([[
filetype plugin on
filetype indent on
]])

-- Set the python provider for neovim
vim.cmd([[
let s:pynvim_path = expand("$HOME/.miniconda3/envs/pynvim3/bin/python")

if !filereadable(s:pynvim_path)
" Bootstrap the python3 conda env with pynvim
echom "Bootstrapping the conda python3 env..."
execute "!" . expand("conda env create -f $HOME/.dotfiles/tools/vim/envs/pynvim3.yml")
endif

let g:python3_host_prog = s:pynvim_path
]])

-- ===========================
-- |=========================|
-- ||                       ||
-- || Editing and Searching ||
-- ||                       ||
-- |=========================|
-- ===========================
--
-- Indent new line the same as the preceding line
o.autoindent = true

-- Tab key enters 2 spaces
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2

-- highlight matching parens, braces, brackets, etc
o.showmatch = true

-- Wildmenu options
o.wildmenu = true
o.wildmode = "longest:full"
o.wildignore = [[*.o,*~,*.pyc,.hg,.svn,*.png,*.jpg,*.gif,*.settings,*.min.js,*.swp,publish/*]]

-- Searching
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true

-- Set ripgrep as default search tool
vim.cmd([[
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  set grepformat=%f:%l:%c:%m,%f:%l:%m
elseif executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  set grepformat=%f:%l:%m
endif
]])

-- Format options
-- + "t"    -- auto-wrap text using textwidth
-- + "c"    -- auto-wrap comments using textwidth
-- + "r"    -- auto insert comment leader on pressing enter
-- + "o"    -- don't insert comment leader on pressing o
-- + "q"    -- format comments with gq
-- - "a"    -- don't autoformat the paragraphs (use some formatter instead)
-- + "n"    -- autoformat numbered list
-- + "b"    -- auto-wrap in insert mode, and do not wrap old long lines
-- - "2"    -- I am a programmer and not a writer
-- + "j"    -- Join comments smartly
o.formatoptions = "tcroqnbj"

-- Folding
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevel = 20

-- Set 7 lines to the cursor - when moving vertically using j/k
o.scrolloff = 7

-- Open new splits to the right or down instead of moving current window
o.splitright = true
o.splitbelow = true

-- Diff options
vim.cmd([[
set diffopt+=iwhite " No whitespace in vimdiff
" Make diffing better: https://vimways.org/2018/the-power-of-diff/
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
]])

-- Set spell location to English and German
wo.spell = true
o.spelllang = "en,de"

-- -----------------------
-- | Appearance Settings |
-- -----------------------
--
-- Enable syntax highlighting for languages
vim.cmd([[syntax enable]])

-- Turn of bell and visual bell
o.visualbell = false

-- Colorscheme and background
o.termguicolors = true
o.background = "dark"
vim.cmd([[colorscheme gruvbox-material]])

-- Always show the status line and tabline
o.showtabline = 2
o.laststatus = 2
o.cmdheight = 1
o.showmode = false

-- Show character column
o.colorcolumn = "80"
o.ruler = true
o.relativenumber = true
o.cursorline = true

-- Wrap lines
o.wrap = true

-- =========================
-- |=======================|
-- ||                     ||
-- || General Keybindings ||
-- ||                     ||
-- |=======================|
-- =========================
--
-- Set the leader key to the space key
map("n", "<SPACE>", "<Nop>")
g.mapleader = " "

-- Set local leader to the backslash
g.maplocalleader = [[\]]

-- ----------------------------------
-- | Vim Tmux Navigator keybindings |
-- ----------------------------------
g.tmux_navigator_no_mappings = 1

smap({ "i", "n", "t" }, "<M-h>", [[<cmd>TmuxNavigateLeft<CR>]])
smap({ "i", "n", "t" }, "<M-j>", [[<cmd>TmuxNavigateDown<CR>]])
smap({ "i", "n", "t" }, "<M-k>", [[<cmd>TmuxNavigateUp<CR>]])
smap({ "i", "n", "t" }, "<M-l>", [[<cmd>TmuxNavigateRight<CR>]])
smap({ "i", "n", "t" }, "<M-o>", [[<cmd>TmuxNavigatePrevious<CR>]])

-- Treat long lines as break lines (useful when moving around in them)
map("n", "j", "gj")
map("n", "k", "gk")

-- Don't deselect visual when indenting in visual mode
map("x", "<", "<gv")
map("x", ">", ">gv")

-- Very magic by default
map("n", "?", [[?\v]])
map("n", "/", [[/\v]])
map("n", "<C-s>", [[:%s/\v]])
map("c", "<C-s>", [[%s/\v]])

-- Search history on command line
map("c", "<C-p>", "<Up>")
map("c", "<C-n>", "<Down>")

-- Toggles between most recent buffers
map("n", "<leader><leader>", "<c-^>")

-- More ergonomic normal mode from integrated terminal
map("t", "jk", [[<c-\><c-n>]])
map("t", "kj", [[<c-\><c-n>]])

-- Shows/hides hidden characters
smap("n", "<leader>,", ":set invlist<CR>")

-- Replacing up to next _ or -
map("n", "<leader>m", "ct_")

-- Automatically correct spelling with the first option
map("i", "<C-l>", "<C-g>u<Esc>[s1z=`]a<C-g>u")

smap("i", "<c-_>", "<cmd>Commentary<CR>", { noremap = false })
smap("n", "<C-c>", "<cmd>Commentary<CR>", { noremap = false })

-- Clear the search buffer to remove highlighting from the last search
smap("n", "<c-_>", [[:let @/ = ""<CR>]])

-- Select the text that was last pasted
smap("n", "gp", [['`[' . strpart(getregtype(), 0,  1) . '`]']], { noremap = true, expr = true })

-- Switch buffers using gb and gB, similar to tabs.
smap("n", "gb", ":bnext<CR>")
smap("n", "gB", ":bprev<CR>")

-- Sort the selected lines
smap("v", "<leader>rs", ":!sort<CR>")

-- Make Y behave like other capital numbers
map("n", "Y", "y$")

-- Keep it centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Undo breakpoints while typing
map("i", ",", ",<C-g>u")
map("i", ".", ".<C-g>u")
map("i", "!", "!<C-g>u")
map("i", "?", "?<C-g>u")

-- Automatically jump to the end of pasted text
map("x", "y", "y`]")
map({ "x", "n" }, "p", "p`]")

-- ----------------------------------------------------
-- | Telescope, LSP, Diagnostics, and Git keybindings |
-- ----------------------------------------------------
--
-- Custom themes
telescope_dynamic_theme = function(opts)
	opts = opts or {}

	local theme_opts = {
		layout_strategy = (o.columns < 120) and "vertical" or "horizontal",
	}

	return vim.tbl_deep_extend("force", theme_opts, opts)
end

--
-- Diagnostics
-- See `:help vim.diagnostic.*` for documentation on any of the below
-- functions
smap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
smap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
smap("n", "]e", "<cmd>lua vim.diagnostic.goto_next()<CR>")
smap("n", "<space>dl", "<cmd>lua vim.diagnostic.setloclist()<CR>")
smap("n", "<space>do", [[:lua require("telescope.builtin").diagnostics(telescope_dynamic_theme())<CR>]])
smap(
	"n",
	"<space>ds",
	[[:lua require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor())<CR>]]
)

-- LSP functions
-- See `:help vim.lsp.*` for documentation on any of the below functions
smap("n", "<leader>k", "<cmd>ShowDocumentation<CR>")
smap("n", "<leader>l", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

-- Goto references with <leader>j...
smap("n", "<leader>jf", [[<cmd>lua require("telescope.builtins").treesitter(telescope_dynamic_theme())<CR>]])
smap("n", "<leader>jc", "<cmd>lua vim.lsp.buf.declaration()<CR>")
smap("n", "<leader>jD", "<cmd>lua vim.lsp.buf.definition()<CR>")
smap("n", "<leader>jd", [[<cmd>lua require("telescope.builtin").lsp_definitions(telescope_dynamic_theme())<CR>]])
smap("n", "<leader>jR", "<cmd>lua vim.lsp.buf.references()<CR>")
smap("n", "<leader>jr", [[<cmd>lua require("telescope.builtin").lsp_references(telescope_dynamic_theme())<CR>]])
smap("n", "<leader>jI", "<cmd>lua vim.lsp.buf.implementation()<CR>")
smap("n", "<leader>ji", [[<cmd>lua require("telescope.builtin").lsp_implementations(telescope_dynamic_theme())<CR>]])
smap("n", "<leader>jT", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
smap("n", "<leader>jt", [[<cmd>lua require("telescope.builtin").lsp_type_definitions(telescope_dynamic_theme())<CR>]])

-- Telescope LSP pickers
smap(
	"n",
	"<leader>ja",
	[[<cmd>lua require("telescope.builtin").lsp_code_actions(require("telescope.themes").get_cursor())<CR>]]
)
smap(
	"n",
	"<leader>jA",
	[[<cmd>lua require("telescope.builtin").lsp_range_code_actions(require("telescope.themes").get_cursor())<CR>]]
)
smap("n", "<leader>jT", [[<cmd>lua require("telescope.builtin").lsp_workspace_symbols(telescope_dynamic_theme())<CR>]])
smap(
	"n",
	"<leader>jt",
	[[<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols(telescope_dynamic_theme())<CR>]]
)
smap("n", "<leader>js", [[<cmd>lua require("telescope.builtin").lsp_document_symbols(telescope_dynamic_theme())<CR>]])

-- Workspace settings with <leader>w...
smap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
smap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
smap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")

-- Refactoring with <leader>r...
smap("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>")
smap("n", "<leader>rq", "<cmd>lua vim.lsp.buf.code_action()<CR>")
smap("n", "<leader>rf", "<cmd>lua vim.lsp.buf.formatting()<CR>")

-- Finding searching and navigating
smap("n", "<leader>;", [[<cmd>lua require("telescope.builtin").commands(telescope_dynamic_theme())<CR>]])
smap("n", "<leader>o", [[<cmd>lua require("telescope.builtin").find_files(telescope_dynamic_theme())<CR>]])
smap("n", "<leader>p", [[<cmd>lua require("telescope.builtin").buffers(telescope_dynamic_theme())<CR>]])
smap("n", "<leader>ff", [[<cmd>lua require("telescope.builtin").live_grep(telescope_dynamic_theme())<CR>]])
smap("n", "<leader>fs", [[<cmd>lua require("telescope.builtin").spell_suggest(telescope_dynamic_theme())<CR>]])
smap(
	"n",
	"<leader>fb",
	[[<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find(telescope_dynamic_theme())<CR>]]
)
smap("n", "<leader>ft", [[<cmd>lua require("telescope.builtin").tags(telescope_dynamic_theme())<CR>]])
smap("n", "<leader>f/", [[<cmd>lua require("telescope.builtin").search_history(telescope_dynamic_theme())<CR>]])
smap("n", "<leader>f;", [[<cmd>lua require("telescope.builtin").command_history(telescope_dynamic_theme())<CR>]])

-- Git shortcuts
smap("n", "<leader>go", [[<cmd>lua require("telescope.builtin").git_files(telescope_dynamic_theme())<CR>]])
smap("n", "<leader>gC", [[<cmd>lua require("telescope.builtin").git_commits(telescope_dynamic_theme())<CR>]])
smap("n", "<leader>gc", [[<cmd>lua require("telescope.builtin").git_bcommits(telescope_dynamic_theme())<CR>]])
smap("n", "<leader>gb", [[<cmd>lua require("telescope.builtin").git_branches(telescope_dynamic_theme())<CR>]])
smap("n", "<leader>gt", [[<cmd>lua require("telescope.builtin").git_status(telescope_dynamic_theme())<CR>]])
smap("n", "<leader>gh", [[<cmd>lua require("telescope.builtin").git_stash(telescope_dynamic_theme())<CR>]])

-- Navigation
smap("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
smap("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

-- -- Git actions related actions with <leader>g...
smap({ "n", "v" }, "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>")
smap({ "n", "v" }, "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>")
smap("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>")
smap("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>")
smap("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>")
smap("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>")
smap("n", "<leader>gL", "<cmd>Gitsigns toggle_current_line_blame<CR>")
smap("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>")
smap("n", "<leader>gD", "<cmd>Gitsigns toggle_deleted<CR>")

-- -- Text object
smap({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>")

-- Cargo shortcuts
smap("n", "<localleader>t", [[<cmd>lua require("crates").toggle()<CR>]])
smap("n", "<localleader>r", [[<cmd>lua require("crates").reload()<CR>]])

smap("n", "<localleader>v", [[<cmd>lua require("crates").show_versions_popup()<CR>]])
smap("n", "<localleader>f", [[<cmd>lua require("crates").show_features_popup()<CR>]])

-- update creates
smap("n", "<localleader>u", [[<cmd>lua require("crates").update_crates()<CR>]])
smap("n", "<localleader>U", [[<cmd>lua require("crates").update_all_crates()<CR>]])
smap("n", "<localleader>g", [[<cmd>lua require("crates").upgrade_crates()<CR>]])
smap("n", "<localleader>G", [[<cmd>lua require("crates").upgrade_all_crates()<CR>]])

-- Setting shortcuts
smap("n", "<leader>ho", [[<cmd>lua require("telescope.builtin").vim_options(telescope_dynamic_theme())<CR>]])
smap(
	"n",
	"<leader>hc",
	[[<cmd>lua require("telescope.builtin").colorscheme(require("telescope.themes").get_dropdown())<CR>]]
)
smap("n", "<leader>hh", [[<cmd>lua require("telescope.builtin").help_tags(telescope_dynamic_theme())<CR>]])
smap("n", "<leader>hm", [[<cmd>lua require("telescope.builtin").man_pages(telescope_dynamic_theme())<CR>]])
smap("n", [[<leader>h']], [[<cmd>lua require("telescope.builtin").marks(telescope_dynamic_theme())<CR>]])
smap("n", "<leader>hk", [[<cmd>lua require("telescope.builtin").keymaps(telescope_dynamic_theme())<CR>]])
smap("n", "<leader>hf", [[<cmd>lua require("telescope.builtin").filetypes(telescope_dynamic_theme())<CR>]])
smap("n", "<leader>hr", [[<cmd>lua require("telescope.builtin").registers(telescope_dynamic_theme())<CR>]])
smap("n", "<leader>hs", [[<cmd>lua require("telescope").extensions.ultisnips.ultisnips(telescope_dynamic_theme())<CR>]])
smap("n", "<leader>ha", [[<cmd>lua require("telescope.builtin").autocommands(telescope_dynamic_theme())<CR>]])
smap("n", "<leader>ht", [[<cmd>lua require("telescope.builtin").pickers(telescope_dynamic_theme())<CR>]])

-- Faster write/save current buffer
smap("n", "<leader>w", "<cmd>write<CR>")
smap("n", "<leader>W", "<cmd>wall<CR>")

-- Resizing splits
smap("n", "<leader>wvp", [[:exe "vertical resize " . (winwidth(0) * 3/2)<CR>]])
smap("n", "<leader>wvm", [[:exe "vertical resize " . (winwidth(0) * 2/3)<CR>]])
smap("n", "<leader>whp", [[:exe "resize " . (winheight(0) * 3/2)<CR>]])
smap("n", "<leader>whm", [[:exe "resize " . (winheight(0) * 2/3)<CR>]])
map("n", "<C-w><", "5<C-w><")
map("n", "<C-w>>", "5<C-w>>")
map("n", "<C-w>-", "5<C-w>-")
map("n", "<C-w>+", "5<C-w>+")

-- ---------------------
-- |   Auto Commands   |
-- ---------------------
-- Reload files changed outside of Vim not currently modified in Vim
autocmd("general_autoread", [[FocusGained,BufEnter,WinEnter * silent! edit]], true)
autocmd("general_autowrite", [[FocusLost,WinLeave * silent! noautocmd write]], true)

-- Prevent accidental writes to buffers that shouldn't be edited
autocmd("unmodifiable", {
	[[FileType help set readonly]],
	[[BufRead *.orig set readonly]],
	[[BufRead *.pacnew set readonly]],
})

-- Jump to last edit position on opening file
-- https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
autocmd(
	"buf_read_post",
	[[BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
)

-- ===================
-- |=================|
-- ||               ||
-- ||   Functions   ||
-- ||               ||
-- |=================|
-- ===================
--
-- Show the cargo.toml documentation.
vim.api.nvim_create_user_command("ShowDocumentation", function()
	local ft = bo.filetype
	if ft == "vim" or ft == "help" then
		vim.api.nvim_command("help " .. fn.expand("<cword>"))
	elseif ft == "man" then
		vim.api.nvim_command("Man " .. fn.expand("<cword>"))
	elseif fn.expand("%:t") == "Cargo.toml" then
		require("crates").show_popup()
	else
		vim.lsp.buf.hover()
	end
end, { nargs = 0 })
