local Harpoon = {}

Harpoon.config = function()
  local telescope_ok, telescope = pcall(require, "telescope")
  if not telescope_ok then
    return
  end

  local status_ok, my_harpoon = pcall(require, "harpoon")

  if not status_ok then
    return
  end

  my_harpoon.setup({
    global_settings = {
      -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
      save_on_toggle = true,

      -- saves the harpoon file upon every change. disabling is unrecommended.
      save_on_change = true,

      -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
      enter_on_sendcmd = false,

      -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
      tmux_autoclose_windows = false,

      -- filetypes that you want to prevent from adding to the harpoon list menu.
      excluded_filetypes = { "harpoon", "nvim-tree", "dashboard" },
    },
  })

  telescope.load_extension "harpoon"
end

return Harpoon
