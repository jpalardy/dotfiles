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

require("telescope").setup({
  defaults = {
    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    layout_config = {
      prompt_position = "top",
    },
    mappings = {
      i = {
        ["<ESC>"] = "close",
      },
    },
  },
})

vim.keymap.set("n", "\\f", ":Telescope find_files<CR>")
vim.keymap.set("n", "\\g", ":Telescope live_grep<CR>")
vim.keymap.set("v", "\\g", 'y:Telescope live_grep<CR><C-R>"')

vim.keymap.set("n", "\\b", ":Telescope buffers<CR>")
vim.keymap.set("n", "\\q", ":Telescope quickfix<CR>")

-- meta-pick
vim.keymap.set("n", "\\t", ":Telescope builtin<CR>")
vim.keymap.set("n", "\\r", ":Telescope resume<CR>")

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

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lsp-configs
local lspconfig = require("lspconfig")
do
  local elixir_ls_path = function()
    local executables = { "language-server.sh", "elixir-ls" }
    for _, exec in ipairs(executables) do
      if vim.fn.executable(exec) == 1 then
        return exec
      end
    end
    return executables[1]
  end
  lspconfig.elixirls.setup({
    cmd = { elixir_ls_path() },
  })
end
lspconfig.zls.setup({})
lspconfig.gopls.setup({})
lspconfig.ts_ls.setup({})

-- border: urgh... works but so manual
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "single"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- border LspInfo
require("lspconfig.ui.windows").default_options.border = "single"

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
    graphql = { "prettier" },
    typescript = { "prettier", lsp_format = "fallback" },
    ["*"] = { "trim_whitespace" },
  },
  default_format_opts = {
    lsp_format = "prefer",
  },
  format_after_save = function(bufnr)
    if vim.b[bufnr].disable_autoformat then
      return
    end
    return {}
  end,
})

vim.api.nvim_create_user_command("ToggleAutoformat", function()
  vim.b.disable_autoformat = not vim.b.disable_autoformat
  print("autoformat: " .. tostring(not vim.b.disable_autoformat))
end, {})

vim.keymap.set("n", ",f", function()
  require("conform").format({ async = true })
end)

vim.keymap.set("n", "<ESC>?", ":ConformInfo<CR>")

vim.keymap.set("n", "<f3>", function()
  if vim.b.show_diagnostics == nil then
    vim.b.show_diagnostics = true
  end
  vim.b.show_diagnostics = not vim.b.show_diagnostics
  if vim.b.show_diagnostics then
    vim.diagnostic.show(nil, 0)
  else
    vim.diagnostic.hide(nil, 0)
  end
end)

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

vim.api.nvim_create_autocmd({ "BufWritePost", "FileType" }, {
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

-------------------------------------------------
-- age
-------------------------------------------------

-- default to ENV vars...
require("age_secret").setup({})
