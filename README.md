# NVIM

![License](https://img.shields.io/badge/License-MIT-green.svg)

A modern **Neovim configuration** focused on **intermediate users**, designed to provide an **up-to-date**, **modular**, and **maintainable** development environment aligned with the **current standards of the Neovim ecosystem**.

This project was created as a response to outdated and deprecated configurations, adapting the setup to the **latest changes in Neovim**, its core plugins, and community-recommended best practices.

---

## 📌 Table of Contents

- Author
- Project Purpose
- Target Audience
- Philosophy and Guidelines
- Operating System
- Technologies Used
- Dependencies
- Project Structure
- Installation
- Core Features
- Language Support
- How to use
- Maintenance and Updates
- Contributing
- License

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

- **Intermediate Neovim users**
- Developers already familiar with plugins, LSP, and modern workflows
- Users who want to understand and maintain their Neovim configuration in Lua

> ⚠️ This project is not recommended for absolute beginners.

---

## 🧠 Philosophy and Guidelines

- Modular configuration
- Use of actively maintained plugins
- Avoidance of deprecated or legacy solutions
- Clear and readable Lua configuration
- Logical separation of concerns:
  - LSP
  - Formaters, Linters
  - UI
  - Utilities
- Easy adaptation to future Neovim releases

---

## 🖥️ Operating System

### Development Environment

- Linux

### Supported Operating Systems

- Linux ✅
- macOS ⚠️ (not officially tested)
- Windows (WSL) ⚠️
- Native Windows ❌

---

## 🧰 Technologies Used

- **Neovim**
- **Lua**
- **Lazy.nvim** – Plugin manager
- **LSP**
- **Mason.nvim** – External tool management
- **nvim-lspconfig** – LSP configuration
- **conform.nvim** – Code formatting
- **nvim-treesitter** – Advanced syntax parsing
- **Fuzzy Finder** (e.g., fzf-lua)
- **Codeium** - IA assistant
- TMUX
- TPM(Tmux Plugin Manager)

---

## 📦 Dependencies

### Required Dependencies

- `Neovim >= 0.10.0` : Required for native Lua configuration, LSP, Treesitter, diagnostics, and modern plugin APIs.
- `Git >= 2.30` : Required to clone and update plugins via Lazy.nvim and others.
- `curl` or `wget`
- `ripgrep`
- `fd`
- `Node.js >= 25.2.1`
- `npm` or `pnpm`
- `Python >= 3.10` : Required for Python-based tooling managed by Mason.
- `pip >= 24.0`
- `Go >= 1.20` : Required for Go tooling and language server support.
- `Ruby >= 4.0.0`
- `gcc >= 13.3.0`
- `fzf >= 0.67.0`
- `tmux >= 3.3`
- `TPM` : git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
- `Nerd Font (any patched font)`
  Some dependencies are managed automatically via **Lazy** and **Mason**, while others must be installed at the system level.
- `Lazy git >= 0.58.0` : recommend checking the official repository for installation(https://github.com/jesseduffield/lazygit)

---

## 📁 Project Structure

```text
.
├── init.lua
├── lua/
│   ├── config/
│   ├── plugins/
│   └── utils/
├── after/
│   └── lsp/
├── lazy-lock.json
└── README.md

```

## 📄 License

This project is licensed under the **MIT License**.  
See the `LICENSE` file for more information.
