-------------------------------------------------
-- slime
-------------------------------------------------

vim.g.slime_target = "tmux"
vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
vim.g.slime_dont_ask_default = 1

vim.keymap.set("n", "<c-c><c-l>", ':SlimeSend0 "\\x0c"<CR>')
vim.keymap.set("n", "<c-c><c-u>", ':SlimeSend0 "\\x15"<CR>')
vim.keymap.set("n", "<c-c>q", ':SlimeSend0 "q"<CR>')
vim.keymap.set("n", "<c-c>j", "<c-c><c-c>}j", { remap = true })

-------------------------------------------------
-- telescope
-------------------------------------------------

vim.keymap.set("n", "\\f", ":Telescope find_files<CR>")
vim.keymap.set("n", "\\g", ":Telescope live_grep<CR>")
vim.keymap.set("n", "\\b", ":Telescope buffers<CR>")
vim.keymap.set("n", "\\h", ":Telescope help_tags<CR>")

-------------------------------------------------
-- treesitter
-------------------------------------------------

require("nvim-treesitter.configs").setup({
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

-------------------------------------------------
-- lspconfig
-------------------------------------------------

local lspconfig = require("lspconfig")
lspconfig.elixirls.setup({
  cmd = { "language_server.sh" },
})
lspconfig.zls.setup({})

-------------------------------------------------
-- conform
-------------------------------------------------

require("conform").setup({
  formatters_by_ft = {
    elixir = { "mix" },
    lua = { "stylua" },
    zig = { "zigfmt" },
  },
  default_format_opts = {
    lsp_format = "prefer",
  },
  format_after_save = {
    lsp_format = "prefer",
  },
})

vim.keymap.set("n", ",f", function()
  require("conform").format({ async = true })
end)
