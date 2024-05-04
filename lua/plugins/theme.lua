return {
  'projekt0n/github-nvim-theme',
  config = function()
    require('github-theme').setup({})
    vim.cmd [[colorscheme github_dark_high_contrast]]
    vim.opt.termguicolors = true
  end
}
-- vim: ts=2 sts=2 sw=2 et
