local send_all_to_qf = function()
  local lines = vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), { type = "V" })

  local qf_entries = {}
  for i, line in ipairs(lines) do
    table.insert(qf_entries, { filename = line, lnum = 1, col = 1 })
  end

  vim.fn.setqflist(qf_entries, "r")
  vim.cmd([[cfirst]])
  vim.cmd([[botright copen]])
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "scratchy",
  callback = function()
    vim.keymap.set("v", "<c-q>", send_all_to_qf)
    vim.keymap.set("v", "<CR>", send_all_to_qf)
  end,
})

vim.keymap.set("n", "<ESC>c", function()
  vim.cmd("vnew")
  vim.fn.FPScratchy("rg -u --files --no-ignore-parent --sort path $DOTFILES/chunks")
end)
