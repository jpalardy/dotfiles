vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.deck" },
  callback = function()
    vim.bo.filetype = "deck"
  end,
})
