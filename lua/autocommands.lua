vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    -- these will be buffer-local keybindings
    -- because they only work if you have an active language server
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = event.buf })
    vim.keymap.set('n', '<leader>gd', require('telescope.builtin').lsp_definitions,
      { buffer = event.buf, desc = '[g]oto [d]efinitions' })
    vim.keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>',
      { buffer = event.buf, desc = '[g]oto [i]mplementations' })
    vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references,
      { buffer = event.buf, desc = '[g]oto [r]eferences' })
    vim.keymap.set('n', '<leader>sh', vim.lsp.buf.signature_help, { buffer = event.buf, desc = '[s]ignature [h]elp' })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = event.buf, desc = '[r]e[n]ame' })
    vim.keymap.set({ 'n', 'x' }, '<C-A-l>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>',
      { buffer = event.buf, desc = 'Format [C-A-l]' })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = event.buf, desc = '[c]ode [a]actions' })
    vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
      { buffer = event.buf, desc = '[w]orkspace [s]ymbols' })
  end
})
-- vim: ts=2 sts=2 sw=2 et
