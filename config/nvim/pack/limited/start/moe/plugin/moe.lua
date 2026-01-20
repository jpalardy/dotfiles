local function fold_until_done()
  -- Get all lines in the buffer
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  -- Find the last line containing `:fold`
  local fold_line = nil
  for i = #lines, 1, -1 do
    if lines[i]:match(":done") then
      fold_line = i
      break
    end
  end

  -- If we found a :fold line, create the fold
  if fold_line and fold_line > 1 then
    -- Create a fold from line 1 to the fold_line
    vim.cmd(string.format("1,%dfold", fold_line))
  end
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.moe" },
  callback = function()
    vim.bo.filetype = "moe"
    fold_until_done()
  end,
})
