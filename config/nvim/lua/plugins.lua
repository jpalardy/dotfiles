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
vim.keymap.set("n", "<c-c>-", "<Plug>SlimeLineSend")

-- cell
-- vim.g.slime_cell_delimiter = "%%"
-- vim.keymap.set("n", "<c-c>d", "<Plug>SlimeSendCell")

-------------------------------------------------
-- fugitive
-------------------------------------------------

vim.keymap.set("n", "\\d", ":Gvdiffsplit<CR>")

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
vim.keymap.set("n", "\\m", ":Telescope lsp_references<CR>")

vim.keymap.set("n", "\\b", ":Telescope buffers<CR>")
vim.keymap.set("n", "\\q", ":Telescope quickfix<CR>")
vim.keymap.set("n", "\\s", ":Telescope git_status<CR>")
vim.keymap.set("n", "\\e", ":Telescope diagnostics<CR>")

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
do
  local elixir_ls_path = function()
    local executables = { "language_server.sh", "elixir-ls" }
    for _, exec in ipairs(executables) do
      if vim.fn.executable(exec) == 1 then
        return exec
      end
    end
    return executables[1]
  end
  vim.lsp.config("elixirls", {
    cmd = { elixir_ls_path() },
  })
end
vim.lsp.enable("zls")
vim.lsp.enable("gopls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("elmls")
vim.lsp.enable("rust_analyzer")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

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
    javascript = { "prettier" },
    typescript = { "prettier", lsp_format = "fallback" },
    r = { "air" },
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
  local new_state = not vim.diagnostic.is_enabled()
  vim.diagnostic.enable(new_state)
  print("diagnostic: " .. tostring(new_state))
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

-- custom: gawk
require("lint").linters.gawk.args = { "-f-", "-Lno-ext" }

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

-- custom: .deck
require("lint").linters.decklint = {
  cmd = "decklint",
  ignore_exitcode = true, -- set this to true if the linter exits with a code != 0 and that's considered normal.
  parser = require("lint.parser").from_errorformat("%f:%l:%c:%m", {
    source = "decklint",
    severity = vim.diagnostic.severity.WARN,
  }),
}
require("lint").linters_by_ft.deck = { "decklint" }

-------------------------------------------------
-- age
-------------------------------------------------

-- default to ENV vars...
require("age_secret").setup({})
