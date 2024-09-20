-- general
vim.opt.wrap = false
vim.opt.number = true
vim.opt.writebackup = false
vim.opt.completeopt = { "menuone", "popup" }
vim.opt.mouse = "i"

-- edit
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.opt_local.formatoptions:remove("o")
    vim.opt_local.formatoptions:remove("r")
  end,
})

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.keymap.set("n", "<ESC><SPACE>", ":nohl<CR>")
vim.keymap.set("n", "<ESC>l", ":set list!<CR>")
vim.keymap.set("n", "<ESC>n", ":set number!<CR>")

-- split
vim.opt.splitright = true
vim.opt.splitbelow = true

-- indent
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.virtualedit = "block"
vim.opt.scrolloff = 1
vim.opt.startofline = true
vim.keymap.set("n", ">", ">>")
vim.keymap.set("n", "<", "<<")

-- vim.cmd("colorscheme gruvbox-material")
vim.cmd("colorscheme tokyonight-night")

-------------------------------------------------
-- SLIME
-------------------------------------------------

vim.g.slime_target = "tmux"
vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
vim.g.slime_dont_ask_default = 1

vim.keymap.set("n", "<c-c><c-l>", ':SlimeSend0 "\\x0c"<CR>')
vim.keymap.set("n", "<c-c><c-u>", ':SlimeSend0 "\\x15"<CR>')
vim.keymap.set("n", "<c-c>q", ':SlimeSend0 "q"<CR>')
-- FIXME decide by use
vim.keymap.set("n", "<c-c>j", "<c-c><c-c>}j", { remap = true })
vim.keymap.set("n", "<c-c>}", "<c-c><c-c>}j", { remap = true })

-------------------------------------------------
-- TELESCOPE
-------------------------------------------------

vim.keymap.set("n", ",ff", ":Telescope find_files<CR>")
vim.keymap.set("n", ",fg", ":Telescope live_grep<CR>")
vim.keymap.set("n", ",fb", ":Telescope buffers<CR>")
vim.keymap.set("n", ",fh", ":Telescope help_tags<CR>")

-------------------------------------------------

require("nvim-treesitter.configs").setup({
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

local lspconfig = require("lspconfig")
lspconfig.elixirls.setup({
  cmd = { vim.fn.expand("$HOME/local/bin/language_server.sh") },
})
lspconfig.zls.setup({})

require("conform").setup({
  formatters_by_ft = {
    elixir = { "mix" },
    lua = { "stylua" },
    zig = { "zigfmt" },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
})

vim.keymap.set("n", ",f", function()
  require("conform").format({ async = true })
end)
