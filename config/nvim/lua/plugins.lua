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
vim.keymap.set("n", "\\q", ":Telescope quickfix<CR>")

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
lspconfig.gopls.setup({})

-------------------------------------------------
-- conform
-------------------------------------------------

-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
require("conform").setup({
  formatters_by_ft = {
    elixir = { "mix" },
    lua = { "stylua" },
    json = { "fixjson" },
    zig = { "zigfmt" },
    html = { "prettier" },
    ["*"] = { "trim_whitespace" },
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

vim.keymap.set("n", "<ESC>?", ":ConformInfo<CR>")

-------------------------------------------------
-- nvim-lint
-------------------------------------------------

-- https://github.com/mfussenegger/nvim-lint#available-linters
require("lint").linters_by_ft = {
  awk = { "gawk" },
  fish = { "fish" },
  json = { "jsonlint" },
  lua = { "luac" },
  sh = { "shellcheck" },
  yaml = { "yamllint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

-- custom: .moe
require("lint").linters.moelint = {
  cmd = "moelint",
  ignore_exitcode = true, -- set this to true if the linter exits with a code != 0 and that's considered normal.
  parser = require("lint.parser").from_errorformat("%f:%l:%c:%m", {
    source = "moelint",
    severity = vim.diagnostic.severity.WARN,
  }),
}
require("lint").linters_by_ft.moe = { "moelint" }
