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
                path = '/usr/lib/jvm/java-21-openjdk',
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

      vim.lsp.enable { 'java', 'jdtls' }
    end,
  },
}

-- File: lua/plugins/java.lua
-- return {
--   'nvim-java/nvim-java',
--   dependencies = {
--     'nvim-java/lua-async-await',
--     'nvim-java/nvim-java-core',
--     'nvim-java/nvim-java-test',
--     'nvim-java/nvim-java-dap',
--     'MunifTanjim/nui.nvim',
--     'neovim/nvim-lspconfig',
--     'mfussenegger/nvim-dap',
--     'williamboman/mason.nvim',
--   },
--   config = function()
--     -- Step 1: Setup nvim-java first, as per the docs
--     require('java').setup {
--       -- Your Java settings here
--       jdk = {
--         -- Match your JDK paths
--         installations = {
--           {
--             name = 'JavaSE-24',
--             path = '/usr/lib/jvm/java-24-openjdk/',
--           },
--           -- {
--           --   name = 'JavaSE-21',
--           --   path = '/usr/lib/jvm/java-21-openjdk',
--           -- },
--         },
--       },
--       -- Other settings
--       settings = {
--         java = {
--           -- JavaFX libraries reference
--           project = {
--             referencedLibraries = {
--               '/home/wahaj/git/javafx-sdk-24.0.1/lib/*.jar',
--             },
--           },
--           -- Keep other Java settings you need
--           signatureHelp = { enabled = true },
--           contentProvider = { preferred = 'fernflower' },
--           completion = {
--             favoriteStaticMembers = {
--               'org.hamcrest.MatcherAssert.assertThat',
--               'org.hamcrest.Matchers.*',
--               'org.hamcrest.CoreMatchers.*',
--               'org.junit.jupiter.api.Assertions.*',
--               'java.util.Objects.requireNonNull',
--               'java.util.Objects.requireNonNullElse',
--               'org.mockito.Mockito.*',
--             },
--           },
--         },
--       },
--     }
--
--     -- Step 2: Setup jdtls with lspconfig, as per the docs
--     require('lspconfig').jdtls.setup {
--       -- Basic configuration
--       capabilities = require('cmp_nvim_lsp').default_capabilities(),
--       -- You can leave most settings to nvim-java, just add any overrides here
--     }
--
--     -- Step 3: Enable the jdtls LSP
--     if vim.lsp and vim.lsp.enable then
--       vim.lsp.enable 'jdtls'
--     end
--   end,
-- }
--
-- return {
--   'nvim-java/nvim-java',
--   dependencies = {
--     'nvim-java/lua-async-await',
--     'nvim-java/nvim-java-core',
--     'nvim-java/nvim-java-test',
--     'nvim-java/nvim-java-dap',
--     'MunifTanjim/nui.nvim',
--     'neovim/nvim-lspconfig',
--     'mfussenegger/nvim-dap',
--     'williamboman/mason.nvim',
--   },
--   config = function()
--     -- Ensure mason is set up first
--     require('mason').setup()
--
--     -- Wait for mason to be ready before configuring nvim-java
--     -- This avoids the "attempt to index local 'location'" error
--     vim.defer_fn(function()
--       -- Step 1: Setup nvim-java
--       require('java').setup {
--         -- Your Java settings here
--         jdk = {
--           -- Match your JDK paths
--           installations = {
--             {
--               name = 'JavaSE-24',
--               path = '/usr/lib/jvm/java-24-openjdk/bin/',
--             },
--             {
--               name = 'JavaSE-21',
--               path = '/usr/lib/jvm/java-21-openjdk',
--             },
--           },
--         },
--         -- Other settings
--         settings = {
--           java = {
--             -- JavaFX libraries reference
--             project = {
--               referencedLibraries = {
--                 '/home/wahaj/git/javafx-sdk-24.0.1/lib/*.jar',
--               },
--             },
--             -- Keep other Java settings you need
--             signatureHelp = { enabled = true },
--             contentProvider = { preferred = 'fernflower' },
--             completion = {
--               favoriteStaticMembers = {
--                 'org.hamcrest.MatcherAssert.assertThat',
--                 'org.hamcrest.Matchers.*',
--                 'org.hamcrest.CoreMatchers.*',
--                 'org.junit.jupiter.api.Assertions.*',
--                 'java.util.Objects.requireNonNull',
--                 'java.util.Objects.requireNonNullElse',
--                 'org.mockito.Mockito.*',
--               },
--             },
--           },
--         },
--       }
--
--       -- Step 2: Setup jdtls with lspconfig after nvim-java is set up
--       require('lspconfig').jdtls.setup {
--         capabilities = require('cmp_nvim_lsp').default_capabilities(),
--       }
--
--       -- Step 3: Enable the jdtls LSP
--       if vim.lsp and vim.lsp.enable then
--         vim.lsp.enable 'jdtls'
--       elseif vim.lsp then
--         -- Fallback for older Neovim versions
--         vim.cmd [[LspStart jdtls]]
--       end
--     end, 100) -- Small delay to ensure mason is fully initialized
--   end,
-- }
