-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

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

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"


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
lvim.keys.normal_mode["<C-Space>"] = "<cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>"
lvim.builtin.which_key.mappings["a"] = { "<cmd>lua require('harpoon.mark').add_file()<CR>", " Add Mark" }
lvim.builtin.which_key.mappings["<leader>"] = {
    "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
    " Harpoon",
}

-- ═════════════ Refactoring which-key ═════════════
lvim.keys.visual_mode["<leader>rr"] = "<cmd>lua require('refactoring').select_refactor()<CR>"


-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
-- ════════════════════════════════
-- Dashboard
-- ════════════════════════════════
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"


-- ════════════════════════════════
-- LSP settings
-- ════════════════════════════════
-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

local capabilities = require("lvim.lsp").common_capabilities()
require("typescript").setup {
    -- disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false,       -- enable debug logging for commands
    go_to_source_definition = {
        fallback = true, -- fall back to standard LSP definition on failure
    },
    sources = {
        require "typescript.extensions.null-ls.code-actions",
    },
    server = { -- pass options to lspconfig's setup method
        on_attach = require("lvim.lsp").common_on_attach,
        on_init = require("lvim.lsp").common_on_init,
        capabilities = capabilities,
        settings = {
            typescript = {
                inlayHints = {
                    includeInlayEnumMemberValueHints = false,
                    includeInlayFunctionLikeReturnTypeHints = false,
                    includeInlayFunctionParameterTypeHints = false,
                    includeInlayParameterNameHints = "literals", -- 'none' | 'literals' | 'all';
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayPropertyDeclarationTypeHints = false,
                    includeInlayVariableTypeHints = false,
                },
            },
        },
    },
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━
-- Set a formatter, this will override the language server formatting capabilities (if it exists)
-- ━━━━━━━━━━━━━━━━━━━━━━━━━
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
    { command = "stylua", filetypes = { "lua" } },
    { command = "shfmt",  filetypes = { "sh", "zsh" } },
    {
        command = "prettierd",
        filetypes = { "css", "javascript", "typescript", "javascriptreact",
            "typescriptreact" }
    },
    { command = "goimports-reviser", filetypes = { "go" } },
})

local lsp_manager = require("lvim.lsp.manager")
-- lsp_manager.setup("golangci_lint_ls", {
lsp_manager.setup("revive", {
    on_init = require("lvim.lsp").common_on_init,
    capabilities = require("lvim.lsp").common_capabilities(),
})

lsp_manager.setup("gopls", {
    on_attach = function(client, bufnr)
        require("lvim.lsp").common_on_attach(client, bufnr)
        local _, _ = pcall(vim.lsp.codelens.refresh)
    end,
    on_init = require("lvim.lsp").common_on_init,
    capabilities = require("lvim.lsp").common_capabilities(),
    settings = {
        gopls = {
            usePlaceholders = true,
            gofumpt = false,
            codelenses = {
                generate = false,
                gc_details = true,
                test = true,
                tidy = true,
            },
        },
    },
})

-- ━━━━━━━━━━━━━━━━━━━━━━━━━
-- Set linters
-- ━━━━━━━━━━━━━━━━━━━━━━━━━
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
    {
        command = "eslint_d",
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", },
    },
    { command = "revive", filetypes = { "go" } }
})

-- ━━━━━━━━━━━━━━━━━━━━━━━━━
-- Set a code actions
-- ━━━━━━━━━━━━━━━━━━━━━━━━━
local null_ls = require("null-ls")
local null_ls_code_actions = null_ls.builtins.code_actions

local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
    null_ls_code_actions.eslint_d.with {
        condition = function(utils)
            return utils.root_has_file {
                ".eslintrc",
                ".eslintrc.js",
                "eslint.config.js",
                ".eslintrc.cjs",
                ".eslintrc.yaml",
                ".eslintrc.yml",
                ".eslintrc.json",
            }
        end,
    },
    null_ls_code_actions.gitsigns,
    null_ls_code_actions.shellcheck,
})

reload("user.plugins")
reload("user.options")
reload("user.surround")
reload("user.indent-line")
reload('user.autocmds')
