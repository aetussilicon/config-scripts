-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
  { 'wakatime/vim-wakatime',  lazy = false },
  { 'rafamadriz/neon' },
  { 'tomasiser/vim-code-dark' },
  { 'Mofiqul/vscode.nvim' },
  -- { 'windwp/nvim-ts-autotag',
  --   require('nvim-ts-autotag').setup({
  --     opts = {
  --       enable_close = true,
  --       enable_rename = true
  --     }
  --   })
  -- }
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "java", "ruby" }
  },
}

lvim.colorscheme = "codedark"
lvim.format_on_save.enabled = true
