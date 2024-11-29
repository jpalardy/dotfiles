-- search
vim.keymap.set("n", "<ESC><SPACE>", ":nohl<CR>")
vim.keymap.set("n", "<ESC>l", ":set list!<CR>")
vim.keymap.set("n", "<ESC>n", ":set number!<CR>")

-- indent
vim.keymap.set("n", ">", ">>")
vim.keymap.set("n", "<", "<<")

-- backward compatibility
vim.cmd("unmap Y")

-- commenting
vim.keymap.set("n", "#", "gcc", { remap = true })
vim.keymap.set("v", "#", "gc", { remap = true })

-- lsp
vim.keymap.set("n", "\\q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- clipboard
vim.keymap.set("v", ",b", '"*y')
vim.keymap.set("n", ",b", '"*p')

-- f-keys
vim.keymap.set("n", "<F7>", ":set wrap!<CR>")
vim.keymap.set("i", "<F7>", "<C-o>:set wrap!<CR>")

-- keep/drop matching lines
vim.keymap.set({ "n", "x" }, ",v", ":v/<C-r>//d<CR>gg", { silent = true })
vim.keymap.set({ "n", "x" }, ",d", ":g/<C-r>//d<CR>gg", { silent = true })
