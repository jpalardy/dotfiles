-- search
vim.keymap.set("n", "<ESC><SPACE>", ":nohl<CR>")
vim.keymap.set("n", "<ESC>l", ":set list!<CR>")
vim.keymap.set("n", "<ESC>n", ":set number!<CR>")
vim.keymap.set("n", "*", "*N")
vim.keymap.set("n", "g*", "g*N")
vim.keymap.set("v", "//", 'y/<C-R>"<CR>')

-- tabs
vim.keymap.set("n", "tt", ":tabedit<CR>")
vim.keymap.set("n", "tf", ":tabedit <cfile><CR>")

-- unimpaired-like
vim.keymap.set("n", "[q", ":cprevious<CR>")
vim.keymap.set("n", "]q", ":cnext<CR>")

-- indent
vim.keymap.set("n", ">", ">>")
vim.keymap.set("n", "<", "<<")

-- backward compatibility
vim.cmd("unmap Y")

-- commenting
vim.keymap.set("n", "#", "gcc", { remap = true })
vim.keymap.set("v", "#", "gc", { remap = true })

-- lsp (and adjacent)
vim.keymap.set("n", "\\ca", vim.lsp.buf.code_action)

-- clipboard
vim.keymap.set("v", ",b", '"*y')
vim.keymap.set("n", ",b", '"*p')

-- f-keys
vim.keymap.set("n", "<F6>", ":set spell!<CR>")
vim.keymap.set("i", "<F6>", "<C-o>:set spell!<CR>")
vim.keymap.set("n", "<F7>", ":set wrap!<CR>")
vim.keymap.set("i", "<F7>", "<C-o>:set wrap!<CR>")

-- keep/drop matching lines
vim.keymap.set({ "n", "x" }, ",v", ":v/<C-r>//d<CR>", { silent = true })
vim.keymap.set({ "n", "x" }, ",d", ":g/<C-r>//d<CR>", { silent = true })

-- translation of vimscript logic, might need tweaking
local function preserve(command)
  local saved_search = vim.fn.getreg("/")
  local cursor = vim.api.nvim_win_get_cursor(0)
  vim.cmd(command)
  vim.api.nvim_win_set_cursor(0, cursor)
  vim.fn.setreg("/", saved_search)
end

-- empty line trim
vim.keymap.set("n", "_B", function()
  preserve("g/\\_^\\n\\{2,}/d")
end)

-- cycle between colorschemes
vim.keymap.set("n", ",c", function()
  local schemes = { "gruvbox", "gruvbox-material", "tokyonight-storm", "tokyonight-moon", "nord" }
  local current = vim.g.colors_name

  local next_scheme = current
  for i, scheme in ipairs(schemes) do
    if scheme == current then
      next_scheme = schemes[i % #schemes + 1]
      break
    end
  end

  vim.cmd("colorscheme " .. next_scheme)
  vim.notify("colorscheme: " .. next_scheme)
end)

-- splits
vim.keymap.set("n", "\\<left>", ":leftabove vnew<CR>")
vim.keymap.set("n", "\\<right>", ":rightbelow vnew<CR>")
vim.keymap.set("n", "\\<up>", ":leftabove  new<CR>")
vim.keymap.set("n", "\\<down>", ":rightbelow new<CR>")
