return {
  "Mofiqul/adwaita.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.adwaita_darker = true
    vim.g.adwaita_disable_cursorline = true
    vim.g.adwaita_transparent = true
    vim.cmd('colorscheme adwaita')
  end,
}
-- vim: ts=2 sts=2 sw=2 et
