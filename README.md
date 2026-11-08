# 💤 My Neovim config (LazyVim)

Based on the [LazyVim](https://github.com/LazyVim/LazyVim) starter.

## Setup on a new machine (macOS)

```sh
# 1. Install dependencies
brew install neovim git ripgrep fd lazygit node

# 2. Back up any existing config (optional)
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
mv ~/.local/share/nvim ~/.local/share/nvim.bak 2>/dev/null

# 3. Clone this repo
git clone https://github.com/<your-username>/nvim-config.git ~/.config/nvim

# 4. Start Neovim — plugins install automatically (versions pinned by lazy-lock.json)
nvim
```

A [Nerd Font](https://www.nerdfonts.com/) is recommended for icons (e.g. `brew install --cask font-jetbrains-mono-nerd-font`).

## Saving changes

```sh
cd ~/.config/nvim
git add -A && git commit -m "Update config" && git push
```
