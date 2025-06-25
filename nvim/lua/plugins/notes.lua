return {
  -- {
  --   'nvim-neorg/neorg',
  --   lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  --   ft = { 'norg' },
  --   version = '*', -- Pin Neorg to the latest stable release
  --   opts = {},
  --   config = true,
  -- },
  -- {
  --   'MeanderingProgrammer/render-markdown.nvim',
  --   dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  --   -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  --   -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  --   ---@module 'render-markdown'
  --   ---@type render.md.UserConfig
  --   opts = {},
  -- },
  {
    'OXY2DEV/markview.nvim',
    lazy = false,

    -- For blink.cmp's completion
    -- source
    dependencies = {
      'saghen/blink.cmp',
    },
  },
  {
    'brianhuster/live-preview.nvim',
    dependencies = {
      -- You can choose one of the following pickers
      -- 'nvim-telescope/telescope.nvim',
      'ibhagwan/fzf-lua',
      -- 'echasnovski/mini.pick',
    },
  },
  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'zathura'
      -- vim.g.vimtex_view_general_viewer = 'xdg-open'
      vim.g.vimtex_compiler_method = 'latexmk'
    end,
  },
  {
    'iurimateus/luasnip-latex-snippets.nvim',
    dependencies = { 'L3MON4D3/LuaSnip' }, -- Ensure LuaSnip is installed
    config = function()
      -- require('luasnip-latex-snippets').setup()
      require('luasnip').config.setup { enable_autosnippets = true }
    end,
  },
}
