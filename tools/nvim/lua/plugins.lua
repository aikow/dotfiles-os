-- Convenience definitions.
local g = vim.g
local fn = vim.fn
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo

-- For bootstrapping packer local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- =====================
-- |===================|
-- ||                 ||
-- || Include Plugins ||
-- ||                 ||
-- |===================|
-- =====================

plugins = require('packer').startup(function(use)
  -- Have packer manage itself
  use 'wbthomason/packer.nvim'

  -- -----------------------------------
  -- | Language Servers and Completion |
  -- -----------------------------------
  --
  -- LSP server for neovim
  use 'neovim/nvim-lspconfig'

  -- Completion framework
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      -- Completion sources for nvim-cmp
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-omni',
      'quangnguyen30192/cmp-nvim-ultisnips',
    },
    config = function()
      -- Setup completion framework nvim-cmp.
      -- See https://github.com/hrsh7th/nvim-cmp#basic-configuration
      local cmp = require('cmp')

      cmp.setup({
        -- Enable LSP snippets
        snippet = {
          expand = function(args)
              vim.fn['UltiSnips#Anon'](args.body)
          end,
        },
        mapping = {
          -- Select items with <c-n> and <c-p> or <tab> and <s-tab>
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<Tab>'] = cmp.mapping.select_next_item(),

          -- Scroll documentation
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          -- Confirm/abort/complete mappings
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          })
        },

        -- Installed sources
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'ultisnips' },
          { name = 'path' },
          { name = 'buffer' },
          { name = 'cmdline' },
          { name = 'crates' },
          { name = 'omni' },
        }),
      })

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline('/', {
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline('?', {
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline('@', {
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
        }
      })

      -- Use cmdline & path source for ':'
      cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
          { name = 'cmdline' },
          { name = 'path' },
        }),
      })
    end
  }

  -- ----------------------------
  -- | Telescope and TreeSitter |
  -- ----------------------------
  -- Search
  use {
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'telescope-fzf-native.nvim',
      },
      config = function() 
        local actions = require('telescope.actions')
        local actions_layout = require('telescope.actions.layout')

        require('telescope').setup {
          defaults = {
            mappings = {
              i = {
                ['<C-n>'] = actions.cycle_history_next,
                ['<C-p>'] = actions.cycle_history_prev,

                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,

                ['<C-_>'] = actions_layout.toggle_preview,

                ['<C-q><C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
                ['<C-q>q'] = actions.smart_add_to_qflist + actions.open_qflist,

                ['<C-l><C-l>'] = actions.smart_send_to_loclist + actions.open_loclist,
                ['<C-l>l'] = actions.smart_add_to_loclist + actions.open_loclist,
              },
              n = {
                ['<C-n>'] = actions.cycle_history_next,
                ['<C-p>'] = actions.cycle_history_prev,

                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,

                ['<C-_>'] = actions_layout.toggle_preview,

                ['<C-space>'] = actions.toggle_selection,

                ['<C-q><C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
                ['<C-q>q'] = actions.smart_add_to_qflist + actions.open_qflist,

                ['<C-l><C-l>'] = actions.smart_send_to_loclist + actions.open_loclist,
                ['<C-l>l'] = actions.smart_add_to_loclist + actions.open_loclist,
              },
            },
            vimgrep_arguments = {
              'rg',
              '--color=never',
              '--no-heading',
              '--with-filename',
              '--line-number',
              '--column',
              '--smart-case',
              '--trim',
            }
          },
          extensions = {
            fzf = {
              fuzzy = true,                    -- false will only do exact matching
              override_generic_sorter = true,  -- override the generic sorter
              override_file_sorter = true,     -- override the file sorter
              case_mode = 'smart_case',        -- or 'ignore_case' or 'respect_case'
                                               -- the default case_mode is 'smart_case'
            },
          },
          pickers = {
          }
        }
        -- To get fzf loaded and working with telescope, you need to call
        -- load_extension, somewhere after setup function:
        require('telescope').load_extension('fzf')
      end
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
    },
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup {
        -- Ensure that all maintained languages are always installed.
        -- ensure_installed = 'maintained',
        sync_install = false,
        -- Allow incremental selection using TreeSitter code regions.
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
          },
        },
        -- Enable TreeSitter syntax highlighing.
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = "latex",
        }
      }
    end,
    run = ':TSUpdate',
  }

  -- Enable correct spelling syntax highlighting with TreeSitter.
  use {
    'lewis6991/spellsitter.nvim',
    config = function()
      require('spellsitter').setup {
        enable = true,
      }
    end,
  }

  -- -----------------
  -- | Code Snippets |
  -- -----------------
  --
  use {
    'sirver/ultisnips',
    config = function()
      vim.g.UltiSnipsExpandTrigger = '<c-j>'
      vim.g.UltiSnipsJumpForwardTrigger = '<c-j>'
      vim.g.UltiSnipsJumpBackwardTrigger = '<c-k>'
    end
  }

  -- -------------------
  -- | General Plugins |
  -- -------------------
  --
  -- Nice helper plugins
  use {
    'tpope/vim-repeat',
    'tpope/vim-commentary',
    'tpope/vim-surround',
    'tpope/vim-vinegar',
    'godlygeek/tabular',
    'christoomey/vim-tmux-navigator',
    'airblade/vim-rooter',
    {
      'junegunn/fzf.vim',
      config = function()
        vim.cmd([[
          let g:fzf_history_dir = '~/.local/share/fzf-history'
        ]])
      end
    },
  }


  -- --------------------
  -- | Language Add-Ons |
  -- --------------------
  --
  -- Git
  use {
    { 'tpope/vim-fugitive', },
    {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('gitsigns').setup {}
      end
    }
  }

  -- Rust
  use {
    {
      'simrat39/rust-tools.nvim',
      requires = 'neovim/nvim-lspconfig',
    },
    {
      'saecki/crates.nvim',
      tag = 'v0.1.0',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
          require('crates').setup()
      end,
      ft = {'toml'}
    }
  }

  -- Latex
  use {
    'lervag/vimtex',
    config = function()
      vim.cmd([[    
        let g:tex_flavor='latex'
        let g:vimtex_view_method='zathura'

        let g:vimtex_quickfix_mode=0
        let g:vimtex_compiler_method='latexmk'
        let g:vimtex_compiler_latexmk = {
              \ 'build_dir'  : 'build',
              \ 'callback'   : 1,
              \ 'continuous' : 1,
              \ 'executable' : 'latexmk',
              \ 'hooks'      : [],
              \ 'options'    : [
                \   '-verbose',
                \   '-file-line-error',
                \   '-synctex=1',
                \   '-interaction=nonstopmode',
                \ ],
                \}

        function! s:latexSurround()
           let b:surround_{char2nr('e')} = '\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}'
           let b:surround_{char2nr('c')} = '\\\1command: \1{\r}'
        endfunction
      ]])
    end,
    ft = {'tex'}
  }
  use {
    'KeitaNakamura/tex-conceal.vim',
    ft = {'tex'}
  }

  -- Markdown
  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
    ft = {'markdown'}
  }

  -- Fish shell syntax support
  use {
    'dag/vim-fish',
  }

  -- ----------------------------
  -- | Themes and customization |
  -- ----------------------------
  -- Vim status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {},
          always_divide_middle = true,
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'fileformat', 'filetype', 'encoding'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {
          lualine_a = {
            {
              'tabs',
              max_length = vim.o.columns / 3,
              mode = 2
            }
          },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        extensions = {}
      }
    end,
  }

  -- Colorschemes
  use { 
    'joshdick/onedark.vim',
    'arcticicestudio/nord-vim',
    'sainnhe/gruvbox-material',
  }

  -- --------------------
  -- | Bootstrap Packer |
  -- --------------------
  --
  -- Automatically set up the configuration after cloning packer.nvim.
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- =============================
-- |===========================|
-- ||                         ||
-- || Additional Plugin Setup ||
-- ||                         ||
-- |===========================|
-- =============================
--

-- -------------------------
-- | Setup Language Server |
-- -------------------------
-- 
-- Setup the neovim LSP server form lspconfig
local on_attach = function(client, bufnr)
  -- Helper functions to define mappins inside the buffer.
  local function set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Setup nvim-cmp with lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')

-- Python language server.
require('lspconfig').pyright.setup {
  capabilities = capabilities,
  settings = {
    formatCommand = "black",
  },
}

-- YAML language server
require('lspconfig').yamlls.setup {}

-- Bash language server
require('lspconfig').bashls.setup {}

-- Setup rust LSP separately, since rust-tools overwrites the LSP server.
require('rust-tools').setup {
  tools = { -- rust-tools options
    autoSetHints = true, -- Automatically set inlay hints
    hover_with_actions = true, -- Show action inside the hover menu
    inlay_hints = {
      show_parameter_hints = true, -- Show parameter hints
      parameter_hints_prefix = '<- ',
      other_hints_prefix = '=> ',
    },
  },
  -- These override the defaults set by rust-tools.nvim.
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ['rust-analyzer'] = {
        -- enable clippy on save
        checkOnSave = {
          command = 'clippy'
        },
        procMacro = {
          enable = true
        },
      }
    },
  },
}

-- Automaticaclly recompile packer plugins.
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return plugins
