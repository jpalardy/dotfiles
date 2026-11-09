local function match_with_dates(snippets)
  local MiniSnippets = require('mini.snippets')
  local matches, region = MiniSnippets.default_match(snippets)
  if matches and #matches > 0 then return matches, region end

  local col = vim.fn.col('.') - 1
  local date = vim.api.nvim_get_current_line():sub(1, col):sub(-10)
  if not date:match('^%d%d%d%d%-%d%d%-%d%d$') then return matches, region end

  local weekday = vim.fn.strftime('%A', vim.fn.strptime('%Y-%m-%d', date))
  return MiniSnippets.default_match({
    { prefix = date, body = date .. ' -- ' .. weekday },
  })
end

vim.b.minisnippets_config = { expand = { match = match_with_dates } }
