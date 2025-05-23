return {
  'nvim-java/nvim-java',
  dependencies = {
    'neovim/nvim-lspconfig',
    config = function()
      require('java').setup()
      vim.lsp.config('java', {
        cmd = {

          jdk = {
            installations = {
              {
                name = 'JavaSE-24',
                path = '/usr/lib/jvm/java-24-openjdk/bin/',
              },
              {
                name = 'JavaSE-21',
                path = '/usr/lib/jvm/java-21-openjdk/bin',
              },
            },
          },
          settings = {
            java = {
              --           -- JavaFX libraries reference
              project = {
                referencedLibraries = {
                  '/home/wahaj/git/javafx-sdk-24.0.1/lib/*.jar',
                },
              },
            },
          },
        },
      })
      vim.lsp.config 'jdtls'
    end,
  },
}
