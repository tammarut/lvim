-- ══════════════════════════════
-- General
-- ══════════════════════════════
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "kanagawa"
-- lvim.lsp.diagnostics.virtual_text = false -- show inline error message
-- lvim.use_icons = false -- disable icons and use a minimalist setup

-- ▶ Line numbers
vim.opt.relativenumber = true
vim.opt.timeoutlen = 250 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.ttimeoutlen = 80
vim.opt.updatetime = 300 -- faster completion
vim.opt.redrawtime = 1500
vim.opt.wrap = false
vim.opt.fillchars = {
    vert = "▕", -- alternatives │
    fold = " ",
    eob = " ", -- suppress ~ at EndOfBuffer
    diff = "╱", -- alternatives = ⣿ ░ ─
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸",
}

-- ▶ Tab and Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.cmdheight = 2      -- more space in the neovim command line for displaying messages

vim.opt.autoread = true
vim.opt.confirm = true
vim.opt.wildignore = {
    "*.aux,*.out,*.toc",
    "*.o,*.obj,*.dll,*.jar,*.pyc,__pycache__,*.rbc,*.class",
    -- media
    "*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp",
    "*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm",
    "*.eot,*.otf,*.ttf,*.woff",
    "*.doc,*.pdf",
    -- archives
    "*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz",
    -- temp/system
    "*.*~,*~ ",
    "*.swp,.lock,.DS_Store,._*,tags.lock",
    -- version control
    ".git,.svn",
}

-- ▶ Appearance
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.clipboard = "unnamedplus"
lvim.builtin.breadcrumbs.active = true


-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
-- Fold
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
vim.opt.foldmethod = "indent"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99
vim.o.foldlevel = 4
vim.o.foldminlines = 1
vim.o.foldnestmax = 3


-- ════════════════════════════════
-- Terminal
-- ════════════════════════════════
lvim.builtin.terminal.active = true


-- ════════════════════════════════
-- Project
-- ════════════════════════════════
lvim.builtin.project.detection_methods = { "lsp", "pattern" }
lvim.builtin.project.patterns = {
    ".git",
    "package-lock.json",
    "yarn.lock",
    "package.json",
    "requirements.txt",
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━
-- Gitsigns
-- ━━━━━━━━━━━━━━━━━━━━━━━━━
lvim.builtin.gitsigns.opts.signcolumn = true
lvim.builtin.gitsigns.opts.word_diff = false
lvim.builtin.gitsigns.opts.current_line_blame = true
lvim.builtin.gitsigns.opts.current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
    relative_time = true,
}


-- ════════════════════════════════
-- Nvim tree explorer
-- ════════════════════════════════
lvim.keys.normal_mode["<A-f>"] = ":NvimTreeFindFile<cr>"
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.renderer.icons.webdev_colors = false
lvim.builtin.nvimtree.setup.renderer.indent_markers = { enable = true }


-- ════════════════════════════════
-- Treesitter
-- ════════════════════════════════
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "go",
    "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.rainbow = {
    enable = true,
    extended_mode = false,
    colors = {
        "DodgerBlue",
        "Orchid",
        "Gold",
    },
    disable = { "html" },
}
lvim.builtin.treesitter.autotag = { enable = true, disable = { "xml" } }
lvim.builtin.treesitter.textobjects = {
    select = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["at"] = "@class.outer",
            ["it"] = "@class.inner",
            ["ac"] = "@call.outer",
            ["ic"] = "@call.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["ai"] = "@conditional.outer",
            ["ii"] = "@conditional.inner",
            ["a/"] = "@comment.outer",
            ["i/"] = "@comment.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["as"] = "@statement.outer",
            ["is"] = "@scopename.inner",
            ["aA"] = "@attribute.outer",
            ["iA"] = "@attribute.inner",
            ["aF"] = "@frame.outer",
            ["iF"] = "@frame.inner",
        },
    },
}
