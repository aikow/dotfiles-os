local M = {}

M.setup = function()
  local ok_configs, configs = pcall(require, "nvim-treesitter.configs")
  if not ok_configs then
    return
  end

  configs.setup({
    ensure_installed = {
      "bash",
      "c",
      "cmake",
      "cpp",
      "fish",
      "go",
      "json",
      "lua",
      "markdown",
      "python",
      "rust",
      "toml",
      "vim",
      "yaml",
    },

    sync_install = false,

    -- Allow incremental selection using Treesitter code regions.
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<leader>v",
        scope_incremental = "<C-l>",
        node_incremental = "<C-k>",
        node_decremental = "<C-j>",
      },
    },

    -- Enable Treesitter syntax highlighting.
    highlight = {
      enable = true,
      -- Disable tree-sitter syntax highlighting for tex files, since
      -- vimtex depends on its own syntax highlighting for some features.
      disable = { "latex" },
    },

    -- Indentation is currently still an experimental feature.
    indent = {
      enable = true,
      disable = { "python" },
    },

    -- Text objects
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["am"] = "@comment.outer",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["ak"] = "@conditional.outer",
          ["ik"] = "@conditional.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["]a"] = "@parameter.inner",
        },
        swap_previous = {
          ["[a"] = "@parameter.inner",
        },
      },
    },
    refactor = {
      highlight_definitions = {
        disable = { "nu" },
        clear_on_cursor_move = true,
      },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "grr",
        },
      },
    },
    playground = {
      enable = true,
      disable = {},
    },
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = { "BufWrite", "CursorHold" },
    },
  })
end

return M
