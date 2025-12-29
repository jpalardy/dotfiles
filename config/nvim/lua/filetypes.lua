-- equalprg -> tap
vim.api.nvim_create_autocmd({ "FileType" }, {
  callback = function()
    -- if equalprg isn't set, set up tap
    if vim.bo.equalprg == "" then
      vim.bo.equalprg = "tap -v filetype=" .. vim.bo.filetype
    end
  end,
})

vim.api.nvim_set_hl(0, "@diff.command", { bg = "#FF0000" })
