# Installation Guide

This guide describes the installation process for the Neovim and tmux configuration.

---

# 1. Install Required Dependencies

Install the required system packages.

### Arch Linux / CachyOS

```bash
sudo pacman -S \
    neovim \
    git \
    tmux \
    curl \
    ripgrep \
    fd \
    fzf \
    tree-sitter \
    tree-sitter-cli \
    gcc \
    make \
    unzip \
    luarocks
```

> **Note**
>
> Node.js is required by many Mason packages (TypeScript, HTML, CSS, JSON, ESLint, Prettier, etc.).
>
> It is recommended to install Node.js using a version manager such as **asdf** or **nvm**.

---

# 2. Clone the Repository

This repository contains Git submodules (TPM and tmux plugins).

Clone it with:

```bash
git clone --recurse-submodules https://github.com/engfelipelacerda/nvim-tmux-config.git
```

If you already cloned it without submodules:

```bash
cd nvim-tmux-config
git submodule update --init --recursive
```

---

# 3. Create Symbolic Links

Instead of copying the configuration files, create symbolic links.

```bash
mkdir -p ~/.config

# Replace /path/to/nvim-tmux-config with where you actually cloned the repo
ln -sfn /path/to/nvim-tmux-config/nvim ~/.config/nvim
ln -sfn /path/to/nvim-tmux-config/tmux/tmux.conf ~/.tmux.conf
```

---

# 4. Install tmux Plugins

Open tmux:

```bash
tmux
```

Install TPM plugins:

```
Ctrl+a
Shift+i
```

After installation, reload the configuration:

```
Ctrl+a
r
```

---

# 5. Open Neovim

Start Neovim:

```bash
nvim
```

On the first launch, **lazy.nvim** will automatically install all plugins.

Wait until the installation finishes before closing Neovim.

---

# 6. Verify Installation

Run:

```vim
:checkhealth
```

Resolve any reported issues before continuing.

If you see:

```
tree-sitter-cli not found
```

Install:

```bash
sudo pacman -S tree-sitter-cli
```

---

# 7. Configure Mason

Open Mason:

```vim
:Mason
```

Install the language servers, formatters, linters, and debuggers required for the languages you use.

See the [How to Use](./README.md#how-to-use) section of the README for the full step-by-step of adding a new language.

---

Installation is complete.

Restart tmux and Neovim if necessary.
