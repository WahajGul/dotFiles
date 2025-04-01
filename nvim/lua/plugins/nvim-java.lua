return {
  'nvim-java/nvim-java',
  ft = 'java',
  config = function()
    require('java').setup()
  end,
  -- Set a high priority so this plugin loads before jdtls is configured
}
