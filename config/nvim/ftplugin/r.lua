vim.keymap.set("n", "<c-c>/", function()
  vim.cmd(string.format("SlimeSend1 %s", vim.fn.expand("<cword>")))
end)

vim.keymap.set("n", "<c-c>?", function()
  vim.cmd(string.format("SlimeSend1 head(%s, n=25)", vim.fn.expand("<cword>")))
end)

vim.keymap.set("n", "<c-c>g", function()
  vim.cmd(string.format("SlimeSend1 dplyr::glimpse(%s)", vim.fn.expand("<cword>")))
end)
