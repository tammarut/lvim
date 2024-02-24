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

reload("user.plugins")
reload("user.options")
reload("user.keymaps")
reload("user.which-key")
reload("user.surround")
reload("user.indent-line")
reload("user.lsp")
reload('user.autocmds')
