local kind = require("user.kind")

-- ════════════════════════════════
-- Key mappings
-- view all the defaults by pressing <leader>Lk
-- ════════════════════════════════
lvim.leader = "space"
-- ▶ Ctrl + S to save file
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- ▶ Switch around buffer
lvim.keys.normal_mode["<Tab>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":BufferLineCyclePrev<CR>"

-- ▶ Shortcut move to beginning line and end line
lvim.keys.normal_mode["B"] = "^"
lvim.keys.normal_mode["E"] = "$"

-- ▶ Copy here until the end lines
lvim.keys.normal_mode["Y"] = "y$"

-- ▶ Keep search results at the center of screen
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"
lvim.keys.normal_mode["J"] = "mzJ`z"
lvim.keys.normal_mode["*"] = "*zz"
lvim.keys.normal_mode["#"] = "#zz"
lvim.keys.normal_mode["g*"] = "g*zz"
lvim.keys.normal_mode["g#"] = "g#zz"

-- ▶ Seleact all
lvim.keys.normal_mode["<C-a>"] = "gg<S-v>G"

-- ▶ Stay in indent mode
lvim.keys.visual_mode["<"] = "<gv"
lvim.keys.visual_mode[">"] = ">gv"

-- ▶ Press "jk" switching to Normal mode
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("v", "jk", "<ESC>")

-- ▶ Delete a word backwards
lvim.keys.normal_mode["dw"] = 'vb"_d'


-- ══════════════════════════════
-- Register (Vim clipboard)
-- ══════════════════════════════
-- ▶ Delete single characters without updating the default register
lvim.keys.normal_mode["x"] = [["_x]]

-- ▶ Paste in visual mode without updating the default register
lvim.keys.visual_mode["p"] = [["_dP]]
lvim.keys.visual_mode["d"] = [["_d]]


-- ══════════════════════════════
-- LSP mappings
-- ══════════════════════════════
lvim.lsp.buffer_mappings.normal_mode["gr"] = {
    ":lua require'telescope.builtin'.lsp_references()<cr>",
    kind.cmp_kind.Reference .. " Find references"
}

lvim.lsp.buffer_mappings.normal_mode["gd"] = {
    ":lua vim.lsp.buf.definition()<cr>",
    -- ":lua require'telescope.builtin'.lsp_definitions()<cr>",
    kind.cmp_kind.Reference .. " Definitions"
}

lvim.lsp.buffer_mappings.normal_mode["gD"] = {
    ":lua vim.lsp.buf.type_definition()<cr>",
    kind.cmp_kind.Reference .. " Type Definition"
}

lvim.lsp.buffer_mappings.normal_mode["gf"] = {
    ":Telescope frecency<cr>",
    kind.cmp_kind.Reference .. " Telescope Frecency"
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- Unmap a default keymapping
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )


-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }
