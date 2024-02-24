local kind = require("user.kind")

-- ════════════════════════════════
-- Which-key
-- ════════════════════════════════
-- ═════════════ Trouble which-key ═════════════
-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
    t = { "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
}

-- ═════════════ Git which-key ═════════════
lvim.builtin.which_key.mappings["g"] = {
    name = "Git",
    -- g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle(12000)<cr>", "Lazygit" },
    g = { "<cmd>Git<cr>", "Git Fugitive" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>GitBlameToggle<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        "Undo Stage Hunk",
    },
    n = { ":!git switch -c ", "Switch New Branch" },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Switch branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    f = { "<cmd>Telescope git_bcommits<cr>", "Checkout buffer commit" },
    d = {
        "<cmd>Gitsigns diffthis HEAD<cr>",
        "Diff",
    },
}

-- ═════════════ TypeScript which-key ═════════════
lvim.builtin.which_key.mappings["C"] = {
    name = "Typescript",
    i = { "<cmd>TypescriptAddMissingImports<Cr>", "AddMissingImports" },
    o = { "<cmd>TypescriptOrganizeImports<cr>", "OrganizeImports" },
    u = { "<cmd>TypescriptRemoveUnused<Cr>", "RemoveUnused" },
    r = { "<cmd>TypescriptRenameFile<Cr>", "RenameFile" },
    f = { "<cmd>TypescriptFixAll<Cr>", "FixAll" },
    g = { "<cmd>TypescriptGoToSourceDefinition<Cr>", "GoToSourceDefinition" },
}

-- ═════════════ Hop which-key ═════════════
lvim.keys.normal_mode["<leader>H"] = ":HopWord<CR>"
lvim.keys.normal_mode["<leader>W"] = ":HopWordCurrentLine<CR>"

-- ═════════════ Harpoon which-key ═════════════
lvim.builtin.which_key.mappings["<leader>"] = {
    name = "Harpoon",
    a = { ":lua require('harpoon.mark').add_file()<cr>", " Add Mark" },
    t = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", " Toggle UI" },
    q = { ":lua require('harpoon.ui').nav_file(1)<cr>", "Goto mark 1" },
    w = { ":lua require('harpoon.ui').nav_file(2)<cr>", "Goto mark 2" },
    e = { ":lua require('harpoon.ui').nav_file(3)<cr>", "Goto mark 3" },
    r = { ":lua require('harpoon.ui').nav_file(4)<cr>", "Goto mark 4" },
    n = { ":lua require('harpoon.ui').nav_next()<cr>", "Next file" },
    p = { ":lua require('harpoon.ui').nav_prev()<cr>", "Prev file" },
}

-- ═════════════ Refactoring which-key ═════════════
lvim.keys.visual_mode["<leader>rr"] = "<cmd>lua require('refactoring').select_refactor()<CR>"
