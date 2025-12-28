-- equalprg -> tap
vim.api.nvim_create_autocmd({ "FileType" }, {
  callback = function()
    local supported_filetypes = {
      "awk",
      "elixir",
      "elm",
      "javascript",
      "lua",
      "sh",
      "typescript",
      "zig",
    }
    if vim.tbl_contains(supported_filetypes, vim.bo.filetype) then
      vim.bo.equalprg = "tap -v filetype=" .. vim.bo.filetype
    end
  end,
})

vim.api.nvim_set_hl(0, "@diff.command", { bg = "#FF0000" })
