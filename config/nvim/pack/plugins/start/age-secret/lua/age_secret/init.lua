local M = {}

function M.setup(user_config)
  local defaults = {
    identity = vim.fn.getenv("AGE_IDENTITY"),
    recipient = vim.fn.getenv("AGE_RECIPIENT"),
    executable = "age",
  }
  local config = vim.tbl_extend("keep", user_config, defaults)

  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.age",
    callback = function()
      vim.bo.filetype = "age"
    end,
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = "age",
    callback = function()
      vim.o.backup = false
      vim.o.writebackup = false
      vim.o.shada = ""
    end,
  })

  vim.api.nvim_create_autocmd({ "BufReadPre", "FileReadPre" }, {
    pattern = "*.age",
    callback = function()
      vim.bo.swapfile = false
      vim.bo.binary = true
      vim.bo.undofile = false
    end,
  })

  vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
    pattern = "*.age",
    callback = function()
      if config.identity == vim.NIL then
        vim.api.nvim_err_writeln("No identity: set the identity option or the AGE_IDENTITY environment variable")
        return
      end

      local template = "%s --decrypt --identity %s"
      vim.cmd("silent '[,']!" .. string.format(template, config.executable, config.identity))
      if vim.v.shell_error ~= 0 then
        vim.api.nvim_err_writeln("decryption failed")
        vim.cmd("silent undo")
        vim.bo.modifiable = false
        return
      end

      vim.bo.filetype = vim.fn.expand("%:t:r:e") .. ".age"
      vim.bo.binary = false
    end,
  })

  vim.api.nvim_create_autocmd({ "BufWriteCmd", "FileWriteCmd" }, {
    pattern = "*.age",
    callback = function(ctx)
      if config.recipient == vim.NIL then
        vim.api.nvim_err_writeln("No recipient: set the recipient option or the AGE_RECIPIENT environment variable")
        return
      end

      local template = "%s --encrypt --recipient %s --armor --output %s"
      vim.cmd("silent '[,']w !" .. string.format(template, config.executable, config.recipient, ctx.file))
      if vim.v.shell_error ~= 0 then
        vim.api.nvim_err_writeln("encryption failed")
        return
      end

      vim.bo.modified = false
    end,
  })
end

return M
