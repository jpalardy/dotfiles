-- context
vim.keymap.set("n", "<ESC>l", ":set list!<CR>")
vim.keymap.set("n", "<ESC>n", ":set number!<CR>")

-- search
vim.keymap.set("n", "<ESC><SPACE>", ":nohl<CR>")
vim.keymap.set("n", "*", "*N")
vim.keymap.set("n", "g*", "g*N")
vim.keymap.set("v", "//", 'y/<C-R>"<CR>')

-- tabs
vim.keymap.set("n", "tt", ":tabedit<CR>")
vim.keymap.set("n", "tf", ":tabedit <cfile><CR>")

-- indent
vim.keymap.set("n", ">", ">>")
vim.keymap.set("n", "<", "<<")

-- backward compatibility
vim.cmd("unmap Y")

-- commenting
vim.keymap.set("n", "#", "gcc", { remap = true })
vim.keymap.set("v", "#", "gc", { remap = true })

-- clipboard
vim.keymap.set("v", ",b", '"*y')
vim.keymap.set("n", ",b", '"*p')

-- f-keys
vim.keymap.set({ "n", "i" }, "<F6>", function()
  if vim.opt.spell:get() then
    vim.opt.spell = false
    vim.opt.dictionary = "/usr/share/dict/words"
  else
    vim.opt.spell = true
    vim.opt.dictionary = ""
  end
end)

vim.keymap.set({ "n", "i" }, "<F7>", function()
  vim.opt.wrap = not vim.opt.wrap:get()
end)

-- keep/drop matching lines
vim.keymap.set({ "n", "x" }, ",v", ":v/<C-r>//d<CR>", { silent = true })
vim.keymap.set({ "n", "x" }, ",d", ":g/<C-r>//d<CR>", { silent = true })

-- translation of vimscript logic, might need tweaking
local function preserve(command)
  local saved_search = vim.fn.getreg("/")
  local cursor = vim.api.nvim_win_get_cursor(0)
  vim.cmd(command)
  pcall(vim.api.nvim_win_set_cursor, 0, cursor)
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

-- split resize
local function resize_to_width(start_line, end_line)
  local max_width = 0
  local lines = vim.api.nvim_buf_get_lines(0, start_line, end_line, false)
  for _, line in ipairs(lines) do
    max_width = math.max(max_width, vim.fn.strdisplaywidth(line))
  end
  local padding = 2
  local gutter = vim.wo.number and vim.wo.numberwidth or 0
  vim.api.nvim_win_set_width(0, max_width + gutter + padding)
end

vim.keymap.set("n", ",-", function()
  resize_to_width(0, -1)
end)
vim.keymap.set("v", ",-", function()
  resize_to_width(vim.fn.line("v") - 1, vim.fn.line("."))
end)
