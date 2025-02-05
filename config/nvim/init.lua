-- general
vim.opt.wrap = false
vim.opt.number = true
vim.opt.completeopt = { "menuone", "popup" }
vim.opt.mouse = "i"
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.scrolloff = 10

-- edit
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.opt_local.formatoptions:remove("o")
    vim.opt_local.formatoptions:remove("r")
  end,
})
vim.opt.inccommand = "split"
vim.opt.writebackup = false

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true

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

-- statusline
vim.opt.statusline = "%<%t %m%r%=%{&fileencoding?&fileencoding:&encoding} [%{&fileformat}] %.(%l,%c%V%) %P"

-- color
vim.cmd("colorscheme nord")

-- lsp
vim.diagnostic.config({ float = { border = "rounded" } })

vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.expand("$DOTFILES/bin/vim-helpers")

-------------------------------------------------

require("mappings")
require("plugins")
require("filetypes")
