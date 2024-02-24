-- ════════════════════════════════
-- Additional Plugins
-- ════════════════════════════════
lvim.plugins = {
    { "rebelot/kanagawa.nvim" },
    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-telescope/telescope.nvim",
        },
        event = "BufWinEnter",
        cmd = "TroubleToggle",
    },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { "HiPhish/nvim-ts-rainbow2" }, -- Rainbow parentheses for Neonvim using tree-sitter
    { "windwp/nvim-ts-autotag" },
    { "kylechui/nvim-surround" },
    {
        "stevearc/dressing.nvim", opts = {}
    },
    {
        "phaazon/hop.nvim",
        branch = 'v2', -- optional but strongly recommended
        event = "BufRead",
        config = function()
            require("user.hhop").config()
        end,
    },
    {
        'nvim-telescope/telescope-frecency.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim', 'kkharji/sqlite.lua' },
    },
    {
        "sindrets/diffview.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        event = "BufRead",
        cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
        lazy = true,
        keys = { "<leader>gd", "<leader>gh" },
        config = function()
            require("user.diffview").config()
        end,
    },
    {
        "tpope/vim-fugitive",
        cmd = {
            "G",
            "Git",
            "Gdiffsplit",
            "Gread",
            "Gwrite",
            "Ggrep",
            "GMove",
            "GDelete",
            "GBrowse",
            "GRemove",
            "GRename",
            "Glgrep",
            "Gedit"
        },
        ft = { "fugitive" }
    },
    { "jose-elias-alvarez/typescript.nvim" }, -- additional functionality for typescript server (e.g. rename file & update imports)
    {
        "ray-x/lsp_signature.nvim",
        event = { "BufRead", "BufNew" },
        config = function()
            require("user.lsp_signature").config()
        end,
    },
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
        config = function()
            require("user.harpoon").config()
        end,
        event = "BufWinEnter",
    },
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" }
        },
        event = "BufWinEnter",
    }
}


lvim.builtin.telescope.on_config_done = function(telescope)
    pcall(telescope.load_extension, "frecency")
end
