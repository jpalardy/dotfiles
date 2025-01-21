vim.api.nvim_create_autocmd({ "FileType" }, {
  callback = function()
    local equalprg = "eq-" .. vim.bo.filetype
    if vim.fn.executable(equalprg) == 1 then
      vim.bo.equalprg = equalprg
    end
  end,
})
