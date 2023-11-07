-- local ok, hop = pcall(require, "hop")
-- if not ok then
--   return
-- end

-- hop.setup({ keys = 'etovxqpdygfblzhckisuran' })

-- ———————————————————
-- Hop key mappings
-- ———————————————————
-- vim.keymap.set('n', '<leader>H', ":HopWord<CR>")
-- vim.keymap.set('n', '<leader>W', ":HopWordCurrentLine<CR>")

-- place this in one of your configuration file(s)
-- local directions = require('hop.hint').HintDirection
-- vim.keymap.set('', 'f', function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
-- end, { remap = true })
-- vim.keymap.set('', 'F', function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
-- end, { remap = true })
-- vim.keymap.set('', 't', function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
-- end, { remap = true })
-- vim.keymap.set('', 'T', function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
-- end, { remap = true })


local Hop = {}

Hop.config = function()
    local status_ok, hop = pcall(require, "hop")
    if not status_ok then
        return
    end

    hop.setup({ keys = 'etovxqpdygfblzhckisuran' })
    local directions = require("hop.hint").HintDirection

    -- Override the default f and F
    vim.keymap.set("", "f", function()
        hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true }
    end, { remap = true })
    vim.keymap.set("", "F", function()
        hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true }
    end, { remap = true })
    vim.keymap.set("", "t", function()
        hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }
    end, { remap = true })
    vim.keymap.set("", "T", function()
        hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }
    end, { remap = true })
end

return Hop
