###############################################################################

# 1) SYSTEM UPDATE

###############################################################################
sudo apt update && sudo apt upgrade -y

###############################################################################

# 2) CORE SYSTEM DEPENDENCIES

###############################################################################

# Build tools (GCC, G++, make, libstdc++)

sudo apt install -y build-essential

# Essential CLI utilities

sudo apt install -y \
 git \
 curl \
 wget \
 ripgrep \
 fd-find \
 unzip \
 ca-certificates

###############################################################################

# 3) NEOVIM (>= 0.10)

###############################################################################

# Recommended: official Neovim repository or AppImage

sudo apt install -y neovim

# Verify

nvim --version

###############################################################################

# 4) NODE.JS (LTS recommended)

###############################################################################

# Recommended via NodeSource

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

# Package managers

sudo npm install -g npm pnpm

# Verify

node -v
npm -v
pnpm -v

###############################################################################

# 5) PYTHON

###############################################################################
sudo apt install -y python3 python3-pip python3-venv

# Upgrade pip

python3 -m pip install --upgrade pip

# Verify

python3 --version
pip --version

###############################################################################

# 6) GO

###############################################################################
sudo apt install -y golang

# Verify

go version

###############################################################################

# 7) RUBY

###############################################################################
sudo apt install -y ruby-full

# Verify

ruby --version

###############################################################################

# 8) DEBUGGING TOOLS (DAP BACKENDS)

###############################################################################
sudo apt install -y gdb lldb

###############################################################################

# 9) TMUX

###############################################################################
sudo apt install -y tmux

# Verify

tmux -V

###############################################################################

# 10) TMUX PLUGIN MANAGER (TPM)

###############################################################################
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

###############################################################################

# 11) FUZZY FINDER

###############################################################################
sudo apt install -y fzf

# Verify

fzf --version

###############################################################################

# 12) NERD FONT (Icons support)

###############################################################################

# Recommended repository: ryanoasis/nerd-fonts

# Example: FiraCode Nerd Font

mkdir -p ~/.local/share/fonts
cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip FiraCode.zip -d ~/.local/share/fonts
fc-cache -fv

###############################################################################

# 13) CLONE THIS REPOSITORY

###############################################################################

# Clone anywhere (example: ~/Projects)

mkdir -p ~/Projects
cd ~/Projects
git clone https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git
cd SEU_REPOSITORIO

###############################################################################

# 14) INSTALL NEOVIM CONFIG

###############################################################################
mkdir -p $HOME/.config

# Copy

cp -r nvim $HOME/.config/

# OR (recommended) symlink

# ln -s $(pwd)/nvim $HOME/.config/nvim

###############################################################################

# 15) INSTALL TMUX CONFIG

###############################################################################
cp -r tmux $HOME/.config/

# OR symlink

# ln -s $(pwd)/tmux $HOME/.config/tmux

# Ensure tmux loads config

ln -sf $HOME/.config/tmux/tmux.conf $HOME/.tmux.conf

###############################################################################

# 16) INSTALL TMUX PLUGINS

###############################################################################

# Enter Tmux:

```sh
tmux
```

# Inside tmux and press:

# <Ctrl>+a then I

# To restart tmux configs press:

# <Ctrl>+a then r

# (This installs all tmux plugins via TPM)

###############################################################################

# 17) INSTALL NEOVIM PLUGINS & TOOLS

###############################################################################

# Go to nvim and the lazy program will install all plugins and dependencies automatically:

```sh
nvim
```

# mason.nvim will manage LSPs, formatters, linters, and debuggers

###############################################################################

# 18) 🤖 AI Assistant (Codeium) Setup

###############################################################################

# This project includes optional AI-powered features provided by **Codeium**.

# These features enhance code completion, inline suggestions, and contextual assistance, but are **not required** for the core functionality of the configuration.

    ---

### 1️⃣ Create a Codeium Account

    1. Visit the official website:
       👉 https://codeium.com

    2. Create a free account using:
       - GitHub
       - Google
       - Email

---

### 2️⃣ Authenticate Codeium in Neovim following the instructions

###############################################################################

# DONE 🎉

###############################################################################
