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

-- Save current buffer on focus lost
vim.api.nvim_create_autocmd({ "BufLeave", "BufUnload", "FocusLost", "WinLeave" }, {
  callback = function(event)
    local print_callback = function()
      local buffer_name = vim.api.nvim_buf_get_name(0)
      vim.fn.timer_start(1300, function() print("Saved " .. buffer_name .. " at " .. vim.fn.strftime("%H:%M:%S")) end)
    end

    local writable_buffer = vim.bo[event.buf].modifiable and vim.bo[event.buf].buftype == ""
    local file_exists = vim.fn.expand("%") ~= ""
    local saved_recently = (vim.b.timestamp or 0) == vim.fn.localtime()
    local being_formatted = (vim.b.saving_format or false)

    if writable_buffer and file_exists and not saved_recently and not being_formatted then
      vim.cmd("silent update")
      print_callback()
    end
  end
})

-- Clear search highlights if non left after moving the cursor
vim.api.nvim_create_autocmd('CursorMoved', {
  group = vim.api.nvim_create_augroup('auto-hlsearch', { clear = true }),
  callback = function()
    if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
      vim.schedule(function() vim.cmd.nohlsearch() end)
    end
  end
})
-- vim: ts=2 sts=2 sw=2 et
