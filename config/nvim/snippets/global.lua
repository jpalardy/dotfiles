local snippets = {
  { prefix = '--', body = '-------------------------------------------------' },
  { prefix = '[]', body = '▒' },
  { prefix = 'hex', body = '$RANDOM_HEX' },
  { prefix = 'uuid', body = '$UUID' },

  -- unicode
  { prefix = 'cr', body = '⏎' },
  { prefix = 'cmd', body = '⌘' },
  { prefix = 'alt', body = '⌥' },
  { prefix = '*', body = '×' },

  -- emojis
  { prefix = ':ok', body = '✅' },
  { prefix = '+1', body = '👍' },
  { prefix = ':x', body = '❌' },
  { prefix = ':tada', body = '🎉' },
  { prefix = ':fire', body = '🔥' },
  { prefix = ':boom', body = '💥' },
  { prefix = ':think', body = '🤔' },
  { prefix = ':grim', body = '😬' },
  { prefix = ':grin', body = '😄' },
  { prefix = ':rot', body = '🔄' },
  { prefix = ':wait', body = '🕒' },
  { prefix = ':shrug', body = [[¯\\_(ツ)_/¯]] },

  -- arrows
  { prefix = ':up', body = '⬆️' },
  { prefix = ':down', body = '⬇️' },
  { prefix = ':left', body = '⬅️' },
  { prefix = ':right', body = '➡️' },
}

local function cycle(items)
  for i, item in ipairs(items) do
    table.insert(snippets, { prefix = item, body = items[i % #items + 1] })
  end
end

cycle({ '%', '🍓', '🍎', '🍏', '🍌', '🫐', '🍒', '🍇', '🥝', '🍋', '🍊', '🍑', '🍍', '🍉' })
cycle({ '_', '📦', '✅' })

return snippets
