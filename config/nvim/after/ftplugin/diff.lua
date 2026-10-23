vim.api.nvim_set_hl(0, "diffFile", { fg = "#ffffff", bg = "#c0392b", bold = true })
-- to avoid (implicit) link to diffFile
vim.api.nvim_set_hl(0, "diffOldFile", { link = "Type" })
