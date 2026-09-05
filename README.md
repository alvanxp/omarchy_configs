# Omarchy configuration

Personal Omarchy, Hyprland, LazyVim, terminal, tmux, and utility configuration.

## Install

```bash
git clone https://github.com/alvanxp/omarchy_configs.git
cd omarchy_configs
./install.sh
```

The installer creates backups and symlinks configuration into `~/.config`.
It does not overwrite the real Git identity; copy `git/config.example` to
`~/.config/git/config` and set your own name and email if needed.

## Notes

- Requires Omarchy's Lua Hyprland configuration and LazyVim/Neovim.
- `hypr/monitors.lua` contains the portable monitor defaults. Adjust it for
  the displays on each machine.
- `nvim/lazy-lock.json` pins the LazyVim plugin versions.
- Legacy `.conf` files and timestamped backups were intentionally excluded.
- The Omarchy package, applications, fonts, and external tools are not
  installed by this repository.

