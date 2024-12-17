vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local encoding = vim.bo.fileencoding
    local format = vim.bo.fileformat
    if encoding ~= "utf-8" or format ~= "unix" then
      vim.notify(
        string.format("Warning: Buffer encoding is '%s' and format is '%s'", encoding, format),
        vim.log.levels.WARN
      )
    end
  end,
  desc = "Warn if buffer encoding is not utf-8 or format is not unix",
})
