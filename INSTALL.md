# Installation Guide

This guide describes the installation process and post-installation steps for the Neovim and tmux configuration.

---

## 1️⃣ Install Dependencies

Before installing the configuration, make sure **all required dependencies** listed in the `README.md` are installed on your system.

👉 Refer to the **Dependencies** section in `README.md` for the full list and official download links.

---

## 2️⃣ Clone Configuration Files

After installing all dependencies, clone this repository and copy the **nvim** and **tmux** folders into your local `.config` directory.
This repository uses **git submodules** (TPM for tmux plugin management).

Clone the repository with submodules:

```bash
git clone --recurse-submodules https://github.com/engfelipelacerda/nvim-tmux-config

# If you already cloned without submodules, run:
git submodule update --init --recursive

# Ensure .config directory exists
mkdir -p ~/.config

# Copy configurations
cp -r nvim-tmux-config/nvim ~/.config/nvim
cp -r nvim-tmux-config/tmux ~/.config/tmux
```

> This repository contains both configurations inside the `nvim/` and `tmux/` folders.

---

## 3️⃣ Post-Installation Configuration

After cloning the tmux configuration, you need to install the tmux plugins first.

1. Open tmux.
2. Press:

   ```text
   Ctrl + a
   ```

3. Then press:

   ```text
   i
   ```

This will install all tmux plugins using TPM.

After the installation finishes, reload the tmux configuration without restarting tmux:

1. Press:

   ```text
   Ctrl + a
   ```

2. Then press:

   ```text
   r
   ```

This reloads the tmux configuration file and applies the changes immediately.

---

## 4️⃣ Connect Codeium (AI Autocompletion)

To enable AI-powered code completion using **Codeium**:

1. Open Neovim.
2. Run the Codeium authentication command (depending on your setup):

   ```vim
   :Codeium Auth
   ```

3. A browser window will open. Log in or create a Codeium account.
4. Authenticate Codeium in Neovim following the instructions
5. After successful authentication, return to Neovim.

Once connected, Codeium will start providing AI code suggestions automatically.

---

✅ Installation is complete. Restart Neovim and tmux if needed to ensure all changes are applied.
