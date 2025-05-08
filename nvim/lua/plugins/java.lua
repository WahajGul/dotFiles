-- File: lua/plugins/java.lua
return {
  'nvim-java/nvim-java',
  dependencies = {
    'nvim-java/lua-async-await',
    'nvim-java/nvim-java-core',
    'nvim-java/nvim-java-test',
    'nvim-java/nvim-java-dap',
    'MunifTanjim/nui.nvim',
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-dap',
    'williamboman/mason.nvim',
  },
  ft = 'java', -- Load only for Java files
  opts = {}, -- This avoids the config function execution that causes the error
  config = function()
    local home = vim.env.HOME

    -- Set up nvim-java with careful initialization to avoid mason errors
    local status_ok, java = pcall(require, 'java')
    if not status_ok then
      vim.notify('nvim-java not found!', vim.log.levels.WARN)
      return
    end

    java.setup {
      -- Transfer settings from your JDTLS config
      jdk = {
        -- Match your JDK paths from your existing config
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
      -- Configure Eclipse settings (carried from your JDTLS config)
      eclipse = {
        -- Mirror what you have in your existing JDTLS setup
        -- "-Xms1g",
        -- "-Xmx2G",
      },
      settings = {
        java = {
          -- Keep all your Java settings from your original JDTLS config
          signatureHelp = { enabled = true },
          contentProvider = { preferred = 'fernflower' },
          completion = {
            favoriteStaticMembers = {
              'org.hamcrest.MatcherAssert.assertThat',
              'org.hamcrest.Matchers.*',
              'org.hamcrest.CoreMatchers.*',
              'org.junit.jupiter.api.Assertions.*',
              'java.util.Objects.requireNonNull',
              'java.util.Objects.requireNonNullElse',
              'org.mockito.Mockito.*',
            },
            filteredTypes = {
              'com.sun.*',
              'io.micrometer.shaded.*',
              'java.awt.*',
              'jdk.*',
              'sun.*',
            },
          },
          sources = {
            organizeImports = {
              starThreshold = 9999,
              staticStarThreshold = 9999,
            },
          },
          codeGeneration = {
            toString = {
              template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
            },
            hashCodeEquals = {
              useJava7Objects = true,
            },
            useBlocks = true,
          },
        },
      },
      -- Configure key mappings (similar to your JDTLS config)
      on_attach = function(client, bufnr)
        -- Your keymaps would go here
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- Regular LSP mappings (these would merge with your global mappings)
        -- Java specific mappings similar to your JDTLS config
        -- vim.keymap.set('n', '<leader>jo', function()
        --   vim.lsp.buf.execute_command { command = 'java.action.organizeImports' }
        -- end, opts)

        -- Enable signature help
        require('lsp_signature').on_attach({
          bind = true,
          handler_opts = {
            border = 'rounded',
          },
        }, bufnr)
      end,
    }
  end,
}
-- return {
--   -- nvim-java plugin for improved Java development
--   {
--     'nvim-java/nvim-java',
--     dependencies = {
--       'nvim-java/lua-async-await',
--       'nvim-java/nvim-java-core',
--       'nvim-java/nvim-java-test',
--       'nvim-java/nvim-java-dap',
--       'MunifTanjim/nui.nvim',
--       'mfussenegger/nvim-dap',
--       {
--         'williamboman/mason.nvim',
--         opts = {
--           registries = {
--             'github:nvim-java/mason-registry',
--             'github:mason-org/mason-registry',
--           },
--         },
--       },
--       'neovim/nvim-lspconfig', -- Important: nvim-java needs to be loaded before lspconfig
--     },
--     priority = 100, -- Higher priority to ensure it loads before lspconfig
--     config = function()
--       require('mason').setup()
--       -- Setup nvim-java
--       require('java').setup {
--         -- Java installation paths
--         jdk = {
--           -- Auto-detect Java installations
--           -- If you want to explicitly set paths, uncomment and adjust below:
--           -- path = "/usr/lib/jvm/java-21-openjdk",
--         },
--
--         -- LSP configuration
--         jdtls = {
--           settings = {
--             java = {
--               -- Java language server settings
--               signatureHelp = { enabled = true },
--               contentProvider = { preferred = 'fernflower' },
--               completion = {
--                 favoriteStaticMembers = {
--                   'org.junit.jupiter.api.Assertions.*',
--                   'java.util.Objects.requireNonNull',
--                   'java.util.Objects.requireNonNullElse',
--                 },
--                 filteredTypes = {
--                   'com.sun.*',
--                   'io.micrometer.shaded.*',
--                   'java.awt.*',
--                   'jdk.*',
--                   'sun.*',
--                 },
--               },
--               sources = {
--                 organizeImports = {
--                   starThreshold = 9999,
--                   staticStarThreshold = 9999,
--                 },
--               },
--               codeGeneration = {
--                 toString = {
--                   template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
--                 },
--                 hashCodeEquals = {
--                   useJava7Objects = true,
--                 },
--                 useBlocks = true,
--               },
--               configuration = {
--                 runtimes = {
--                   {
--                     name = 'JavaSE-24',
--                     path = '/usr/lib/jvm/java-24-openjdk',
--                   },
--                   {
--                     name = 'JavaSE-21',
--                     path = '/usr/lib/jvm/java-21-openjdk',
--                   },
--                 },
--               },
--             },
--           },
--         },
--
--         -- Debugging configuration
--         dap = {
--           enabled = true,
--         },
--
--         -- Testing configuration
--         test = {
--           enabled = true,
--         },
--
--         -- UI settings
--         ui = {
--           enabled = true,
--         },
--       }
--
--       -- Set up jdtls through lspconfig AFTER nvim-java is initialized
--       require('lspconfig').jdtls.setup {}
--
--       -- Optional: Java-specific keymaps
--       vim.api.nvim_create_autocmd('FileType', {
--         pattern = 'java',
--         callback = function()
--           local opts = { noremap = true, silent = true, buffer = true }
--
--           -- Project commands
--           vim.keymap.set('n', '<leader>jp', function()
--             require('java').project.open_project()
--           end, opts)
--           vim.keymap.set('n', '<leader>jl', function()
--             require('java').project.open_project_list()
--           end, opts)
--
--           -- Testing commands
--           vim.keymap.set('n', '<leader>jt', function()
--             require('java').test.run.run_test()
--           end, opts)
--           vim.keymap.set('n', '<leader>jn', function()
--             require('java').test.run.run_nearest_test()
--           end, opts)
--
--           -- Imports and code actions
--           vim.keymap.set('n', '<leader>jo', function()
--             require('java').organize_imports()
--           end, opts)
--           vim.keymap.set('n', '<leader>jc', function()
--             require('java').code_action()
--           end, opts)
--         end,
--       })
--     end,
--   },
-- }
