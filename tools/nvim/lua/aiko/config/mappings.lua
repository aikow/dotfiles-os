-- Key Mappings
-- ============
--
-- Leader Mappings
-- ---------------
--
-- | leader<key> | Layered | Category                       |
-- | ----------- |         | ------------------------       |
-- | c           |         | Change text up to next _       |
-- | d           |         | Diagnostics                    |
-- | e           |         | Open diagnostic window         |
-- | f           |         | Find                           |
-- | g           | Yes     | Git                            |
-- | h           |         | Vim internal settings and help |
-- | i           |         | Telescope previous picker      |
-- | j           |         | Telescope LSP                  |
-- | k           |         | LSP signature help             |
-- | l           |         | Builtin LSP                    |
-- | o           |         | Telescope find files           |
-- | p           |         | Telescope buffers              |
-- | r           |         | Refactoring                    |
-- | s           |         | Snippets                       |
-- | v           |         | Tree-Sitter select region      |
-- | w           |         | Write current file             |
-- | W           |         | Write all files                |
-- | <leader>    |         | Switch to most recent buffer   |
-- | ;           |         | Telescope commands             |

local map = vim.keymap.set

-- Vim tmux navigator keybindings to seamlessly switch between vim and tmux
-- panes.
map("n", "<M-h>", [[<cmd>TmuxNavigateLeft<CR>]], { silent = true })
map("n", "<M-j>", [[<cmd>TmuxNavigateDown<CR>]], { silent = true })
map("n", "<M-k>", [[<cmd>TmuxNavigateUp<CR>]], { silent = true })
map("n", "<M-l>", [[<cmd>TmuxNavigateRight<CR>]], { silent = true })
map("n", "<M-o>", [[<cmd>TmuxNavigatePrevious<CR>]], { silent = true })

map("i", "<M-h>", [[<esc>:TmuxNavigateLeft<CR>]], { silent = true })
map("i", "<M-j>", [[<esc>:TmuxNavigateDown<CR>]], { silent = true })
map("i", "<M-k>", [[<esc>:TmuxNavigateUp<CR>]], { silent = true })
map("i", "<M-l>", [[<esc>:TmuxNavigateRight<CR>]], { silent = true })
map("i", "<M-o>", [[<esc>:TmuxNavigatePrevious<CR>]], { silent = true })

map("t", "<M-h>", [[<C-\><C-n>:TmuxNavigateLeft<CR>]], { silent = true })
map("t", "<M-j>", [[<C-\><C-n>:TmuxNavigateDown<CR>]], { silent = true })
map("t", "<M-k>", [[<C-\><C-n>:TmuxNavigateUp<CR>]], { silent = true })
map("t", "<M-l>", [[<C-\><C-n>:TmuxNavigateRight<CR>]], { silent = true })
map("t", "<M-o>", [[<C-\><C-n>:TmuxNavigatePrevious<CR>]], { silent = true })

-- Treat long lines as break lines.
map("n", "j", "gj")
map("n", "k", "gk")

-- Don't deselect visual when indenting in visual mode>
map("x", "<", "<gv")
map("x", ">", ">gv")

-- Very magic regexps by default.
map("n", "?", [[?\v]])
map("n", "/", [[/\v]])
map("n", "<C-s>", [[:%s/\v]])
map("x", "<C-s>", [[:s/\v]])
map("c", "<C-s>", [[%s/\v]])

-- Enter a lua command.
map("n", "<C-l>", [[:lua ]], { desc = "enter lua command" })
map("n", "<C-l><C-l>", [[:lua =]], { desc = "display lua expression" })

-- Search history on command line
map("c", "<C-p>", "<Up>")
map("c", "<C-n>", "<Down>")

-- Toggles between most recent buffers
map("n", "<leader><leader>", "<c-^>", { desc = "switch to most recent buffer" })

-- More ergonomic normal mode from integrated terminal.
map("t", "<M-e>", [[<c-\><C-n>]])

-- Navigate quickfix list
map("n", "]q", [[<cmd>cnext<CR>]])
map("n", "[q", [[<cmd>cprev<CR>]])
map("n", "]Q", [[<cmd>clast<CR>]])
map("n", "[Q", [[<cmd>cfirst<CR>]])

-- Navigate location list
map("n", "]l", [[<cmd>lnext<CR>]])
map("n", "[l", [[<cmd>lprev<CR>]])
map("n", "]L", [[<cmd>llast<CR>]])
map("n", "[L", [[<cmd>lfirst<CR>]])

-- navigate buffers
map("n", "]b", [[<cmd>bnext<CR>]])
map("n", "[b", [[<cmd>bprev<CR>]])
map("n", "]B", [[<cmd>blast<CR>]])
map("n", "[B", [[<cmd>bfirst<CR>]])

-- navigate files
map("n", "]f", [[<cmd>next<CR>]])
map("n", "[f", [[<cmd>prev<CR>]])
map("n", "]F", [[<cmd>last<CR>]])
map("n", "[F", [[<cmd>first<CR>]])

-- Replacing up to next _ or -
map("n", "<leader>c", "ct_", { desc = "change text up to next underscore '_'" })

-- TODO: Find out why this isn't working. Possible create issue on GitHub.
-- Automatically correct spelling with the first option
map(
  "i",
  "<C-s>",
  [[<C-g>u<Esc>[s1z=`]a<C-g>u]],
  { desc = "correct last spelling mistake" }
)
vim.cmd([[imap <C-s> <C-g>u<Esc>[s1z=`]a<C-g>u]])

-- Clear the search buffer to remove highlighting from the last search
map(
  "n",
  "<C-_>",
  [[:let @/ = ""<CR>]],
  { silent = true, desc = "clear search buffer register" }
)

-- Select the text that was last pasted
map(
  "n",
  "gp",
  [['`[' . strpart(getregtype(), 0,  1) . '`]']],
  { expr = true, desc = "select the last pasted region" }
)
-- Automatically jump to the end of pasted text
map("x", "y", "y`]")
map({ "x", "n" }, "p", "p`]")

-- Sort the selected lines
map("v", "<leader>rs", ":!sort<CR>", {
  silent = true,
  desc = "sort the selected region with the sort command via the shell",
})

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

-- Shortcuts for inserting filename, directory name, and full path into command
-- mode.
map("c", "%H", [[<C-R>=expand('%:h:p') . '/'<CR>]])
map("c", "%T", [[<C-R>=expand('%:t')<CR>]])
map("c", "%P", [[<C-R>=expand('%:p')<CR>]])

-- Faster write/save current buffer
map("n", "<leader>w", "<cmd>write<CR>")
map("n", "<leader>W", "<cmd>wall<CR>")

-- Faster pane resizing
map("n", "<C-w><", "5<C-w><")
map("n", "<C-w>>", "5<C-w>>")
map("n", "<C-w>-", "5<C-w>-")
map("n", "<C-w>+", "5<C-w>+")

-- See `:help vim.lsp.*` for documentation on any of the below functions
vim.keymap.set("n", "K", function()
  local ft = vim.bo.filetype
  if ft == "vim" or ft == "help" then
    vim.api.nvim_command("help " .. vim.fn.expand("<cword>"))
  elseif ft == "man" then
    vim.api.nvim_command("Man " .. vim.fn.expand("<cword>"))
  elseif vim.fn.expand("%:t") == "Cargo.toml" then
    require("crates").show_popup()
  else
    vim.lsp.buf.hover()
  end
end, { desc = "show documentation" })
vim.keymap.set(
  "n",
  "<leader>k",
  vim.lsp.buf.signature_help,
  { desc = "signature help" }
)

require("aiko.plugins.configs.telescope").mappings()
require("aiko.plugins.configs.neotree").mappings()
