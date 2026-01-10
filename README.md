# NVIM

![License](https://img.shields.io/badge/License-MIT-green.svg)

A modern **Neovim configuration** focused on **intermediate users**, designed to provide an **up-to-date**, **modular**, and **maintainable** development environment aligned with the **current standards of the Neovim ecosystem**.

This project was created as a response to outdated and deprecated configurations, adapting the setup to the **latest changes in Neovim**, its core plugins, and community-recommended best practices.

---

## 📌 Table of Contents

## 📌 Table of Contents

- [Author](#author)
- [Project Purpose](#project-purpose)
- [Target Audience](#target-audience)
- [Operating System](#operating-system)
- [Technologies Used](#technologies-used)
- [Dependencies](#dependencies)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Core Features](#core-features)
- [Language Support](#language-support)
- [How to use](#how-to-use)
- [Maintenance and Updates](#maintenance-and-updates)
- [Contributing](#contributing)
- [License](#license)

---

## 👤 Author

- **Name: Luis Felipe Pessoa Lacerda**
- **Email: engluisfelipepessoa@gmail.com**
- **GitHub: https://github.com/engfelipelacerda**
- **Bachelor’s Degree in Computer Engineering** (in progress)  
  Federal University of Ceará (Universidade Federal do Ceará – UFC)

---

## 🎯 Project Purpose

This project was created out of the need to design a modern, reliable, and future-proof Neovim configuration from scratch, fully aligned with the latest stable versions of Neovim and its ecosystem.

Over time, many community configurations became incompatible or unstable due to major changes in core components such as Neovim itself, Lazy.nvim, nvim-treesitter, and the built-in LSP client. Common issues encountered in outdated setups include runtime errors like treesitter.configs not found, deprecated APIs, broken plugin loading, incorrect Treesitter initialization, and inconsistent LSP behavior.

This repository aims to eliminate these issues by rebuilding the configuration using the current recommended patterns, APIs, and plugin specifications. Special care was taken to ensure correct initialization order, proper plugin lazy-loading, and full compatibility with recent changes in:

- Neovim core APIs
- Lazy.nvim plugin specifications
- nvim-treesitter module loading
- LSP configuration and attachment lifecycle
- Mason.nvim tooling management
- Formatting and linting workflows
- Autocompletion and snippet integration
- The project integrates modern development tools such as Treesitter, Language Servers, formatters, linters, autocompletion engines, snippets, terminal multiplexing (tmux), fuzzy finding, and optional AI-assisted workflows, all following the current best practices of the Neovim ecosystem.
- This configuration is intended for intermediate users who want a clean, extensible, and well-structured Neovim setup that can serve both as a daily driver and as a learning reference for modern Neovim architecture.
- Finally, it is important to note that this is an actively developed project. The configuration is continuously refined to adapt to upstream changes, fix newly discovered issues, and incorporate improvements as Neovim and its plugins evolve.

---

## 👥 Target Audience

This project is primarily intended for:

- **Intermediate Neovim users** who already have practical experience with custom configurations
- Developers familiar with **plugins, LSP integration, and modern Neovim workflows**
- Users who want to **understand, customize, and maintain** their Neovim setup using Lua

> ⚠️ **Note:** This project is not recommended for absolute beginners, as it assumes prior knowledge of Neovim concepts and configuration practices.

---

## 💻 Operating System

### Development Environment (Tested)

This project was developed and tested on the following environment:

- **Operating System:** Pop!\_OS 24.04 LTS (COSMIC desktop)
- **Kernel:** Linux 6.17.9-76061709-generic
- **Architecture:** x86_64
- **Shell:** zsh
- **Neovim:** Latest stable release
- **Terminal:** Tilix

> ⚠️ While the project is designed to be portable across Linux distributions, minor adjustments may be required depending on the operating system, desktop environment, or package manager used.

---

### Supported Operating Systems

- **Linux** ✅ (fully supported)
- **macOS** ⚠️ (not officially tested; expected to work with minor adjustments)
- **Windows (WSL)** ⚠️ (supported, but with limited functionality in some areas)
- **Native Windows** ❌ (not supported)

---

## 🧰 Main Technologies Used

- **Neovim**  
  Core text editor used as the primary development environment, providing extensibility, performance, and a modern editing experience.
- **Lua**  
  Main configuration and scripting language, used to define editor behavior, plugins, and custom logic.
- **lazy.nvim**  
  Plugin manager responsible for lazy-loading, dependency resolution, and performance optimization.
- **Mason.nvim**  
  Manages external development tools such as LSP servers, formatters, linters, and debuggers.
- **nvim-lspconfig**  
  Provides configuration presets and helpers for integrating Language Server Protocol (LSP) servers.
- **conform.nvim**  
  Handles automatic code formatting across multiple languages.
- **nvim-treesitter**  
  Enables advanced syntax parsing, highlighting, and code-aware features based on Tree-sitter.
- **Fuzzy Finder** (e.g. **fzf-lua**)  
  Offers fast and efficient fuzzy searching for files, buffers, symbols, and more.
- **DAP (Debug Adapter Protocol)**  
  Provides debugging capabilities by integrating language-specific debuggers into Neovim.
- **nvim-dap**  
  Core implementation of the Debug Adapter Protocol for Neovim, enabling breakpoints, stepping, and variable inspection.
- **TMUX**  
  Terminal multiplexer used to manage multiple sessions, windows, and panes efficiently.
- **TPM (Tmux Plugin Manager)**  
  Manages TMUX plugins and ensures consistent terminal workflow customization.
- **Codeium (AI Assistant)**  
  AI-powered code assistant integrated into Neovim, providing intelligent code completion, inline suggestions, and contextual assistance across multiple programming languages.  
  It enhances developer productivity by offering real-time recommendations, reducing boilerplate, and assisting with code exploration and refactoring.

---

## 📦 Dependencies

This project relies on a combination of system-level tools, language runtimes, and optional utilities to provide a complete and modern Neovim experience.

Some dependencies are managed automatically via **lazy.nvim** and **mason.nvim**, while others must be installed at the system level.

---

### 🧠 Core Requirements

- **Neovim ≥ 0.10.0**  
  Required for native Lua configuration, built-in LSP client, Treesitter integration, diagnostics, and modern plugin APIs.  
  👉 https://github.com/neovim/neovim

- **Git ≥ 2.30**  
  Used to clone, update, and manage plugins (via lazy.nvim, TPM, etc.).  
  👉 https://git-scm.com/

---

### 🔧 Essential System Utilities

- **curl** / **wget**  
  Used to download external tools, language servers, and installers.  
  👉 https://curl.se / https://www.gnu.org/software/wget/

- **ripgrep (rg)**  
  High-performance search tool used by fuzzy finders and search plugins.  
  👉 https://github.com/BurntSushi/ripgrep

- **fd**  
  Fast and user-friendly alternative to `find`, used by file pickers.  
  👉 https://github.com/sharkdp/fd

- **Fuzzy Finder & UI**
  fzf ≥ 0.67.0.
  Provides fast fuzzy searching for files, buffers, commands, and symbols.
  👉 https://github.com/junegunn/fzf

- Nerd Font (patched font)
  Required for proper rendering of icons in the UI.
  Recommended repository:
  👉 https://github.com/ryanoasis/nerd-fonts

---

### 🛠 🌐 Language Runtimes, Build & Compilation Tools

- **GCC / G++ (C/C++ toolchain)**  
  Required to compile native extensions, Treesitter parsers, and some LSP/debug adapters.  
  On most Linux distributions, this is provided by **build-essential**.

- These runtimes are required for language servers, formatters, linters, and debuggers managed by Mason.

- Node.js ≥ 20 (LTS recommended)
  Required for many LSP servers (TypeScript, ESLint, JSON, HTML, etc.).
  Package managers: npm, pnpm, or yarn.
  👉 https://nodejs.org/

- Python ≥ 3.10
  Used for Python-based tooling, formatters, and debuggers.
  👉 https://www.python.org/

- pip ≥ 24.0
  Python package manager required for installing Python tools.
  👉 https://pip.pypa.io/

- Go ≥ 1.20
  Required for Go language server (gopls), debuggers, and related tooling.
  👉 https://go.dev/

- Ruby ≥ 3.0
  Used by certain formatters and Ruby language tooling.
  👉 https://www.ruby-lang.org/

- Debug adapters are installed via Mason, but system debuggers may be required depending on the language:
  - lldb (C / C++)
  - gdb (C / C++)
  - delve (Go)

---

## 🗂 Project Structure

```text
.
├── nvim/
│   ├── after/
│   │   └── lsp/            # Post-LSP configurations and overrides
│   ├── lua/
│   │   ├── config/         # Core editor configuration (options, keymaps, autocmds)
│   │   └── plugins/        # Plugin specifications and setup (Lazy.nvim)
│   ├── init.lua            # Neovim entry point
│
├── tmux/
│   ├── plugins/            # TMUX plugins managed by TPM
│   ├── scripts/            # Custom TMUX helper scripts
│   └── tmux.conf           # Main TMUX configuration file
│
├── INSTALL.md              # Full copy-paste installation guide
└── README.md               # Project documentation

```

---

## ⚙️ Installation

## ⚙️ Installation

This project requires several system-level dependencies and a manual setup process.

For a complete, step-by-step installation guide — including all required dependencies, system tools, Neovim and TMUX configuration, and optional components — please refer to the dedicated installation document:

👉 **[INSTALL.md](./INSTALL.md)**

The installation guide is designed to be **copied and pasted directly** into the terminal and was primarily tested on **Linux (Pop!\_OS 24.04 – COSMIC)**.

> ⚠️ Other Linux distributions, macOS, or WSL may require minor adjustments.

---

## 📄 License

This project is licensed under the **MIT License**.  
See the `LICENSE` file for more information.
