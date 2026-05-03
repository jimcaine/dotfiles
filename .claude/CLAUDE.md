# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

Personal dotfiles for an Arch Linux + Hyprland desktop. Config files live under `dotfiles/` and are **copied** (not symlinked) to `~/.config/` during setup. There is no build system or test suite.

## Deploying Changes

After editing a config file in this repo, copy it to the live location to apply it:

```bash
# Hyprland (auto-reloads on file save for most options)
cp -r dotfiles/hypr ~/.config/

# Waybar (requires restart)
cp -r dotfiles/waybar ~/.config/
pkill waybar || true && waybar &

# Zsh (source to apply in current session)
cp dotfiles/zsh/.zshrc ~/.zshrc && cp -r dotfiles/zsh ~/.config/
source ~/.zshrc

# Neovim (takes effect on next launch)
cp -r dotfiles/nvim ~/.config/

# Tmux (reload config)
cp dotfiles/tmux/tmux.conf ~/.tmux.conf
# then inside tmux: prefix + r
```

Fresh Arch install setup:
```bash
curl https://raw.githubusercontent.com/jimcaine/dotfiles/refs/heads/main/setup/arch/setup.sh | bash
```

## Architecture

### dotfiles/hypr/
Hyprland WM config split into modules sourced from `hyprland.conf`:
- `modules/keybindings.conf` — all keybinds; `$mainMod = SUPER`
- `modules/autostart.conf` — services launched at login (waybar, ollama, docker, wallpaper)
- `modules/monitors.conf`, `input.conf`, `look-and-feel.conf`, `windows.conf`, `env.conf`

### dotfiles/zsh/
Modular zsh config. `~/.zshrc` sources `~/.config/zsh/*.zshrc`. Each file is a self-contained topic (nvm, pyenv, rust, eza, gcloud, etc.). `arch.zshrc` is commented out by default in `.zshrc` and must be opted into.

### dotfiles/nvim/
Neovim config under `lua/jimbro/`:
- `core/` — options, keymaps (`<Space>` leader, `jk`/`kj` → Esc)
- `plugins/` — one file per plugin, loaded via lazy.nvim
- `plugins/lsp/` — LSP configuration

### dotfiles/waybar/
Waybar status bar config + `scripts/waybar-wttr.py` for weather. Reload with `~/.config/waybar/reload.sh` or `SUPER+SHIFT+R`.

### setup/
OS-specific bootstrap scripts. `setup/arch/setup.sh` is the primary one — installs pacman + AUR packages, runs pyenv/nvm/rust setup, copies dotfiles, enables systemd services.

## Key Bindings (Hyprland)

| Binding | Action |
|---|---|
| `SUPER+Return` | Open kitty terminal |
| `SUPER+Space` | Rofi app launcher |
| `SUPER+Q` | Kill active window |
| `SUPER+Escape` | Power menu (rofi) |
| `SUPER+R` | Toggle wallpaper |
| `SUPER+SHIFT+R` | Reload waybar |
| `SUPER+/` | Show hotkeys (rofi dmenu) |
| `CTRL+←/→` | Switch workspaces |
