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
    lazygit \
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
ln -sfn /path/to/nvim-tmux-config/tmux ~/.config/tmux
```

> **Why the whole `tmux/` folder and not just `tmux.conf`?**
> `tmux.conf` references its helper scripts using the fixed path `~/.config/tmux/scripts/...`. If you only symlink the `.conf` file, those scripts won't be found and the popup menu (`Ctrl+a w`) / scratch terminal (`Ctrl+t`) will fail. Since tmux >= 3.1 automatically looks for `~/.config/tmux/tmux.conf`, linking the whole folder as `~/.config/tmux` is all you need — there's no separate `~/.tmux.conf` symlink to create anymore.

---

# 4. Install TPM (Tmux Plugin Manager)

`tmux.conf` bootstraps TPM from `~/.tmux/plugins/tpm` — a **different location** from the `tmux/plugins/` folder inside this repo. TPM has to be installed there directly:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

> The `tmux/plugins/*` submodules bundled in this repo (tmux-sensible, vim-tmux-navigator, tmux-resurrect, tmux-continuum, tmux-yank, tmux-powerkit) are not actually loaded from there — once TPM is installed at `~/.tmux/plugins/tpm`, it downloads its own copies of every `@plugin` listed in `tmux.conf` straight from GitHub into `~/.tmux/plugins/`. The copies inside the repo exist only because of how the project was cloned (`--recurse-submodules`) and aren't required for the setup to work.

---

# 5. Install tmux Plugins

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

Most tools are installed automatically: `mason-tool-installer.nvim` (formatters/linters) and `mason-nvim-dap.nvim` (debug adapters — `codelldb`, `debugpy`, `delve`, `java-debug-adapter`, `java-test`) both run on Neovim startup, so the first launch may take a couple of minutes while everything downloads in the background.

Open Mason to check progress or install anything manually:

```vim
:Mason
```

Install the language servers, formatters, linters, and debuggers required for the languages you use.

> **Note — Java and Python debugging**
>
> The debug _adapters_ themselves are installed automatically by Mason, but they still need the actual language runtime present on your system:
>
> - **Java**: a **JDK 17+** must be available (used both by `jdtls` and by your project). Install it with your package manager or via `asdf` (see [README.md](./README.md#language-runtimes)).
> - **Python**: a system **Python 3** installation is required to run your scripts; `debugpy` itself is bundled by Mason and needs no separate `pip install`.

See the [How to Use](./README.md#how-to-use) section of the README for the full step-by-step of adding a new language — including how to wire up debugging (DAP) for it.

---

Installation is complete.

Restart tmux and Neovim if necessary.
