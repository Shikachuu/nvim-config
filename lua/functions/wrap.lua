function Create_wrapper(start_char, end_char)
  return function()
    -- Get the current visual selection
    local bufnr = vim.api.nvim_get_current_buf()
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")

    -- Adjust the positions because vim's positions are 1-indexed and end-exclusive
    start_pos[2] = start_pos[2] - 1
    start_pos[3] = start_pos[3] - 1
    end_pos[2] = end_pos[2] - 1
    end_pos[3] = end_pos[3]

    -- Get the selected text
    local lines = vim.api.nvim_buf_get_lines(bufnr, start_pos[2], end_pos[2] + 1, false)
    local selected_text = table.concat(lines, "\n")

    -- Wrap the selected text in start_char and end_char
    local wrapped_text = start_char .. selected_text .. end_char

    -- Replace the selected text with the wrapped text
    vim.api.nvim_buf_set_text(bufnr, start_pos[2], start_pos[3], end_pos[2], end_pos[3], {wrapped_text})

    -- Recalculate the start and end positions
    start_pos = vim.fn.getpos("'<")
    end_pos = vim.fn.getpos("'>")
  end
end
-- vim: ts=2 sts=2 sw=2 et
