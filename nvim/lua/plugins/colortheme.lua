return {
  'oxfist/night-owl.nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- load the colorscheme here
    require('night-owl').setup()
    vim.cmd.colorscheme 'night-owl'
  end,
}
-- old color scheme
-- return {
--  "Mofiqul/dracula.nvim",
--   Lazy = false,
--   priority = 1000,
--   config = function()
-- 	 vim.cmd[[colorscheme dracula]]
--   --vim.cmd[[colorscheme dracula-soft]]
--
--   end
--
--   -- Configure LazyVim to load dracula
--
--
-- }
