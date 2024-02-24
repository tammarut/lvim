-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


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
reload("user.keymaps")
reload("user.which-key")
reload("user.surround")
reload("user.indent-line")
reload('user.autocmds')
