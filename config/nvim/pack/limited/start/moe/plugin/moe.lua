vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.moe" },
  callback = function()
    vim.bo.filetype = "moe"
  end,
})
