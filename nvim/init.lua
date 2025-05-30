require 'core.options'
require 'core.snippets'
require 'core.keymaps'
-- require 'core.autocmds'

-- Set up the Lazy plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set up plugins
require('lazy').setup {
  require 'plugins.tree-sitter',
  require 'plugins.neo-tree',
  -- require 'plugins.oil-nvim',
  require 'plugins.snacks',
  require 'plugins.autocompletion',
  require 'plugins.colorscheme',
  require 'plugins.bufferline',
  require 'plugins.lualine',
  -- require 'plugins.nvim-java',
  require 'plugins.nvim-jdtls',
  require 'plugins.misc',
  require 'plugins.kickStart-lsp',
  require 'plugins.null',
  require 'plugins.notes',
}
