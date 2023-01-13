return {
  -- -------------------------
  -- |   Neovim Tree Views   |
  -- -------------------------
  --
  -- File tree in a sidebar.
  {
    "kyazdani42/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeFocus" },
    keys = {
      {
        "_",
        "<cmd>NvimTreeFindFile<CR>",
        silent = true,
        desc = "open nvim-tree",
      },
    },
    config = function()
      local nvim_tree = require("nvim-tree")
      local icons = require("aiko.ui.icons")

      nvim_tree.setup({
        disable_netrw = false,
        hijack_netrw = false,

        open_on_setup = false,

        hijack_cursor = true,
        hijack_directories = {
          enable = true,
        },
        hijack_unnamed_buffer_when_opening = false,

        update_cwd = true,
        update_focused_file = {
          enable = true,
          update_cwd = false,
        },

        view = {
          adaptive_size = false,
          side = "left",
          width = 40,
          hide_root_folder = true,
        },

        diagnostics = {
          enable = false,
          show_on_dirs = true,
          icons = {
            hint = icons.diagnostics.hint,
            info = icons.diagnostics.info,
            warning = icons.diagnostics.warn,
            error = icons.diagnostics.error,
          },
        },

        git = {
          enable = true,
          ignore = true,
        },

        filesystem_watchers = {
          enable = true,
        },

        actions = {
          change_dir = {
            enable = false,
            restrict_above_cwd = false,
          },
          open_file = {
            resize_window = false,
          },
        },

        renderer = {
          highlight_git = true,
          highlight_opened_files = "none",

          indent_markers = {
            enable = false,
          },

          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },

            glyphs = {
              default = "",
              symlink = "",
              folder = {
                default = "",
                empty = "",
                empty_open = "",
                open = "",
                symlink = "",
                symlink_open = "",
                arrow_open = "",
                arrow_closed = "",
              },
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "",
                ignored = "◌",
              },
            },
          },
        },
      })
    end,
  },

  -- Enhance vim's builtin netrw plugin.
  {
    "tpope/vim-vinegar",
  },

  -- A tree like view for symbols using LSP.
  {
    "simrat39/symbols-outline.nvim",
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
    config = function()
      require("symbols-outline").setup({
        keymaps = {
          close = { "<Esc>", "q" },
          code_actions = "a",
          focus_location = "o",
          fold = "h",
          fold_all = "W",
          fold_reset = "R",
          goto_location = "<CR>",
          hover_symbol = { "<C-space>", "K" },
          rename_symbol = "r",
          toggle_preview = "p",
          unfold = "l",
          unfold_all = "E",
        },
      })
    end,
  },

  -- -----------------------
  -- |   General Plugins   |
  -- -----------------------
  --
  -- Use '.' to repeat plugin code actions.
  {
    "tpope/vim-repeat",
  },

  -- Show indentation.
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        filetype_exclude = {
          "",
          "NvimTree",
          "Outline",
          "TelescopePrompt",
          "TelescopeResults",
          "alpha",
          "help",
          "lazy",
          "lspinfo",
          "man",
          "mason",
          "norg",
          "packer",
          "terminal",
        },
        buftype_exclude = { "terminal" },
        use_treesitter = false,
        show_trailing_blankline_indent = false,
        show_first_indent_level = false,
        show_current_context = true,
        show_current_context_start = false,
      })
    end,
  },

  -- Effortlessly switch between vim and tmux windows.
  {
    "christoomey/vim-tmux-navigator",
    config = function()
      vim.g.tmux_navigator_no_mappings = 1
      vim.g.tmux_navigator_disable_when_zoomed = 1
    end,
  },

  -- Align tabular data.
  {
    "godlygeek/tabular",
    cmd = "Tabularize",
    config = function()
      -- Add tabular pattern to parse latex table with multicolumns
      vim.cmd.AddTabularPattern(
        [[latex_table /\v(\&)|(\\multicolumn(\{[^}]*\}){3})@=/]]
      )
    end,
  },

  -- Automatically cd to project root.
  {
    "airblade/vim-rooter",
    config = function()
      vim.g.rooter_patterns = {
        ".editorconfig", -- general editor settings
        ".exrc", -- nvim config
        ".git", -- git
        ".hg", -- mercurial
        ".nvimrc", -- nvim config
        ".svn", -- subversion
        "Cargo.toml", -- rust
        "Makefile", -- c/c++
        "package.json", -- javascript
        "pyproject.toml", -- python
        "setup.cfg", -- python
      }
      vim.g.rooter_silent_chdir = 1
    end,
  },

  {
    "folke/neoconf.nvim",
    enabled = false,
  },

  {
    "danymat/neogen",
    keys = {
      {
        "<leader>nm",
        "<cmd>Neogen func<CR>",
        desc = "Neogen generate function docstring",
      },
      {
        "<leader>nt",
        "<cmd>Neogen type<CR>",
        desc = "Neogen generate type docstring",
      },
      {
        "<leader>nf",
        "<cmd>Neogen file<CR>",
        desc = "Neogen generate file docstring",
      },
      {
        "<leader>no",
        "<cmd>Neogen class<CR>",
        desc = "Neogen generate class docstring",
      },
    },
    config = function()
      require("neogen").setup({
        snippet_engine = "luasnip",
      })
    end,
  },

  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "BufReadPost",
    keys = {
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next todo comment",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous todo comment",
      },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo Trouble" },
      {
        "<leader>xtt",
        "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",
        desc = "Todo Trouble",
      },
      { "<leader>xT", "<cmd>TodoTelescope<cr>", desc = "Todo Telescope" },
    },
    config = function()
      require("todo-comments").setup({
        signs = true,
        sign_priority = 1,
      })
    end,
  },

  {
    "autopairs.nvim",
    enabled = false,
    config = function()
      local autopairs = require("nvim-autopairs")
      local cmp = require("cmp")

      autopairs.setup({
        fast_wrap = {},
        disable_filetype = { "TelescopePrompt", "vim" },
      })

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")

      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
