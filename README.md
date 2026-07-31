# NVIM + TMUX

![License](https://img.shields.io/badge/License-MIT-green.svg)

A modern **Neovim + tmux configuration** focused on **intermediate users**, designed to provide an **up-to-date**, **modular**, and **maintainable** development environment aligned with the **current standards of the Neovim ecosystem**.

This project was created as a response to outdated and deprecated configurations, adapting the setup to the **latest changes in Neovim**, its core plugins, and community-recommended best practices.

---

## 📌 Table of Contents

- [Author](#author)
- [Project Purpose](#project-purpose)
- [Target Audience](#target-audience)
- [Operating System](#operating-system)
- [Technologies Used](#technologies-used)
- [Dependencies](#dependencies)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [How to Use](#how-to-use)
- [Keybindings](#️-keybindings)
- [License](#license)

---

## Author

- **Name: Luis Felipe Pessoa Lacerda**
- **Email: engluisfelipepessoa@gmail.com**
- **GitHub: https://github.com/engfelipelacerda**
- **Bachelor’s Degree in Computer Engineering** (in progress)
  Federal University of Ceará (Universidade Federal do Ceará – UFC)

---

## Project Purpose

This project was created out of the need to design a modern, reliable, and future-proof Neovim configuration from scratch, fully aligned with the latest stable versions of Neovim and its ecosystem.

Over time, many community configurations became incompatible or unstable due to major changes in core components such as Neovim itself, Lazy.nvim, nvim-treesitter, and the built-in LSP client. Common issues encountered in outdated setups include runtime errors like `treesitter.configs not found`, deprecated APIs, broken plugin loading, incorrect Treesitter initialization, and inconsistent LSP behavior.

This repository aims to eliminate these issues by rebuilding the configuration using current recommended patterns, APIs, and plugin specifications. Special care was taken to ensure correct initialization order, proper plugin lazy-loading, and full compatibility with recent changes in:

- Neovim core APIs
- Lazy.nvim plugin specifications
- nvim-treesitter module loading
- LSP configuration and attachment lifecycle
- Mason.nvim tooling management
- Formatting and linting workflows
- Autocompletion and snippet integration

The project integrates modern development tools such as Treesitter, Language Servers, formatters, linters, autocompletion engines, snippets, terminal multiplexing (tmux), fuzzy finding, and debugging (DAP), all following the current best practices of the Neovim ecosystem.

This configuration is intended for intermediate users who want a clean, extensible, and well-structured Neovim setup that can serve both as a daily driver and as a learning reference for modern Neovim architecture.

This is an actively developed project. The configuration is continuously refined to adapt to upstream changes, fix newly discovered issues, and incorporate improvements as Neovim and its plugins evolve.

---

## Target Audience

This project is primarily intended for:

- **Intermediate Neovim users** who already have practical experience with custom configurations
- Developers familiar with **plugins, LSP integration, and modern Neovim workflows**
- Users who want to **understand, customize, and maintain** their Neovim setup using Lua

> ⚠️ **Note:** This project is not recommended for absolute beginners, as it assumes prior knowledge of Neovim concepts and configuration practices.

---

## Operating System

### Development Environment (Tested)

This project is developed and tested on:

- **Operating System:** CachyOS (Arch-based)
- **Architecture:** x86_64
- **Shell:** bash
- **Neovim:** Latest stable release
- **tmux:** >= 3.4

> ⚠️ The install instructions in [INSTALL.md](./INSTALL.md) target Arch-based distributions (`pacman`). While the Neovim/tmux configuration itself is portable, the system-dependency step will need to be adapted for other package managers.

- **Arch-based Linux (CachyOS, Arch, Manjaro, etc.)** ✅ (fully supported)
- **Other Linux distributions** ⚠️ (config works, but you'll need to install the dependencies with your own package manager — apt, dnf, zypper, etc.)
- **macOS** ⚠️ (not officially tested; expected to work with minor adjustments, e.g. via Homebrew)
- **Windows (WSL)** ⚠️ (supported, but with limited functionality in some areas — clipboard, popups)
- **Native Windows** ❌ (not supported)

---

## Technologies Used

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
- **nvim-lint**
  Runs linters asynchronously and surfaces their diagnostics inside Neovim.
- **nvim-treesitter**
  Enables advanced syntax parsing, highlighting, and code-aware features based on Tree-sitter.
- **fzf-lua**
  Offers fast and efficient fuzzy searching for files, buffers, symbols, and more.
- **nvim-dap** + **nvim-dap-ui**
  Debug Adapter Protocol implementation for Neovim, enabling breakpoints, stepping, and variable inspection, with a visual UI.
- **mason-nvim-dap.nvim**
  Bridges Mason and nvim-dap, automatically installing and wiring up debug adapters (`codelldb`, `debugpy`, etc.).
- **nvim-dap-python**
  Generates ready-to-use Python debug configurations (launch file, launch with arguments, attach remote) on top of `debugpy`.
- **nvim-jdtls**
  Eclipse JDT Language Server client for Java, also responsible for wiring the Java debugger (`java-debug-adapter` + `java-test` bundles) into nvim-dap.
- **TMUX**
  Terminal multiplexer used to manage multiple sessions, windows, and panes efficiently.
- **TPM (Tmux Plugin Manager)**
  Manages TMUX plugins and ensures consistent terminal workflow customization.

---

## Dependencies

### Core

- Neovim >= 0.10
- Git
- tmux >= 3.4

### System utilities

- curl
- ripgrep
- fd
- fzf
- tree-sitter-cli
- unzip

### Build tools

- GCC / G++ (C/C++ toolchain) — required to compile native extensions, Treesitter parsers, and some LSP/debug adapters
- make

### Fonts

- A Nerd Font (recommended: JetBrainsMono Nerd Font)

### Language runtimes

Install only the runtimes you need for the languages you work with. Common choice:

- **Node.js >= 20 (LTS recommended)** — required by many LSP servers and Mason packages (TypeScript, ESLint, JSON, HTML, CSS, etc.). Use a version manager such as `asdf` or `nvm`.
- **JDK 17+** — required by `jdtls` (the Java language server) to run itself, and by your own Java projects. Recommended via `asdf` (`asdf plugin add java` + `asdf install java temurin-21.0.4+7`).
- **Maven and/or Gradle** — required to build/debug Java projects (`jdtls` looks for `pom.xml`, `gradlew`, or `.git` to detect the project root). Also installable via `asdf` (`asdf plugin add maven` / `asdf plugin add gradle`).
- **Python 3** — required to actually run/debug Python code. `debugpy` (the Python debug adapter) is installed automatically by Mason and does **not** need a separate `pip install`.

> Debug adapters themselves (`codelldb`, `debugpy`, `java-debug-adapter`, `java-test`) are installed automatically by Mason on first launch — they don't need to be installed manually, only the underlying language runtime (JDK, Python, etc.) does.

---

## Project Structure

```text
.
├── nvim/
│   ├── ftplugin/
│   │   └── java.lua        # Per-filetype overrides (e.g. jdtls setup for Java)
│   ├── lua/
│   │   ├── config/         # Core editor configuration (options, keymaps, autocmds, LSP, DAP)
│   │   └── plugins/        # Plugin specifications and setup (Lazy.nvim)
│   │       ├── dap/        # Debug Adapter Protocol plugins
│   │       └── lsp/        # LSP, Mason, formatting and linting plugins
│   ├── init.lua            # Neovim entry point
│   └── lazy-lock.json       # Plugin version lockfile (managed by lazy.nvim)
│
├── tmux/
│   ├── plugins/            # TMUX plugins managed by TPM (git submodules)
│   ├── scripts/            # Custom TMUX helper scripts (menu, scratch popup)
│   └── tmux.conf           # Main TMUX configuration file
│
├── INSTALL.md              # Full copy-paste installation guide
└── README.md               # Project documentation
```

---

## Installation

This project requires several system-level dependencies and a manual setup process.

For a complete, step-by-step installation guide — including all required dependencies, system tools, Neovim and TMUX configuration, and optional components — please refer to the dedicated installation document:

👉 **[INSTALL.md](./INSTALL.md)**

The installation guide is designed to be **copied and pasted directly** into the terminal and was primarily tested on **Arch-based Linux (CachyOS)**.

> ⚠️ Other Linux distributions, macOS, or WSL may require minor adjustments (mainly to the package-installation step).

---

## How to Use

After installation, you must configure the programming languages you want to use.
This config relies on **Treesitter**, **Mason**, and **LSP** to provide syntax highlighting, autocomplete, diagnostics, formatting, and linting.

Adding a new language is done in **four main steps**.

### 1️⃣ Add the language to Treesitter (better colors & syntax)

Edit `nvim/lua/plugins/treesitter.lua` and add the desired language inside the `install(...)` list:

```lua
require("nvim-treesitter").install({
  "lua",
  "python",
  "javascript",
  "typescript",
  -- add your new language here
})
```

Treesitter is responsible for: advanced syntax highlighting, smart indentation, incremental selection, better code readability.

### 2️⃣ Install linters, formatters, and tools (Mason Tool Installer)

Edit `nvim/lua/plugins/lsp/mason-tool-installer-nvim.lua` and add the required tools to `ensure_installed`:

```lua
ensure_installed = {
  -- Formatters
  "prettier",
  "stylua",
  -- add formatters for the new language here

  -- Linters
  "eslint_d",
  "luacheck",
  -- add linters for the new language here
}
```

This step enables: automatic code formatting, static code analysis, integration with conform.nvim and nvim-lint.

### 3️⃣ Add the Language Server (LSP)

Edit `nvim/lua/plugins/lsp/mason.lua` and add the language server to `ensure_installed`:

```lua
ensure_installed = {
  "lua_ls",
  "pyright",
  "ts_ls",
  -- add the LSP server for the new language here
}
```

The LSP provides: intelligent autocomplete, real-time errors and warnings, code navigation (definitions, references), inline documentation.

### 4️⃣ Formatting and Linting Setup

To configure formatters per language, edit `nvim/lua/plugins/lsp/conform-formatters-nvim.lua`:

```lua
formatters_by_ft = {
  lua = { "stylua" },
  javascript = { "prettier" },
  typescript = { "prettier" },
  -- add here
}
```

To configure linters per language, edit `nvim/lua/plugins/lsp/nvim-lint.lua`:

```lua
lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  -- add here
}
```

### 5️⃣ Add debugging support (DAP)

Debugging is not covered by the 4 steps above — it's a separate integration. There are always up to 3 pieces:

1. **Adapter** — the "engine" that actually runs/stops the process (`codelldb`, `debugpy`, `delve`, ...). List it in `nvim/lua/plugins/dap/mason-nvim-dap.lua` → `ensure_installed`, so Mason installs it automatically:
   ```lua
   ensure_installed = {
     "codelldb", -- C / C++
     "debugpy", -- Python
     -- add your new adapter here
   }
   ```
2. **Configuration** — the "run profile" nvim-dap uses to launch a debug session. For most languages this is a `dap.configurations.<filetype>` table in `nvim/lua/config/dap.lua`. See the existing C/C++ entries there as a template — you'll also need a matching `dap.adapters.<name>` entry in `nvim/lua/config/dap-adapters.lua` if the adapter isn't already defined.
3. **Language-specific plugin** (only when the adapter needs more glue than a generic launch config) — e.g. Python uses `nvim-dap-python` (`nvim/lua/plugins/dap/nvim-dap-python.lua`), which generates its own configs from `debugpy`. Java uses `nvim-jdtls`, which needs the `java-debug-adapter` and `java-test` Mason packages (listed in `mason-tool-installer-nvim.lua`) loaded as bundles in `nvim/ftplugin/java.lua`, since Java's debugger is embedded in the language server itself rather than being a standalone DAP adapter.

Since `plugins/dap/` is auto-imported by lazy.nvim (see `nvim/lua/config/lazy.lua`), dropping a new file in that folder is enough for it to be picked up — no extra registration step needed.

### 🔁 Apply changes

After configuring a language:

1. Save all files
2. Restart Neovim
3. Let Mason automatically install the required dependencies

Check the installation status any time with:

```vim
:Mason
```

---

## ⌨️ Keybindings

> The **leader key** is set to `Space` (see `nvim/lua/config/globals.lua`). Every `<leader>` below means "press Space, then the following key(s)".

### Neovim — General

| Key                 | Action                                        |
| ------------------- | --------------------------------------------- |
| `n` / `N`           | Next/previous search result (screen centered) |
| `Ctrl+d` / `Ctrl+u` | Half page down/up (centered)                  |
| `J`                 | Join line below, keep cursor position         |
| `<` / `>` (visual)  | Indent and reselect                           |
| `<leader>rc`        | Open `init.lua` to edit the config            |

### Neovim — Windows, Splits & Buffers

| Key                         | Action                                                                          |
| --------------------------- | ------------------------------------------------------------------------------- |
| `Ctrl+h/j/k/l`              | Navigate between nvim splits **and** tmux panes seamlessly (vim-tmux-navigator) |
| `<leader>sv`                | Split window vertically                                                         |
| `<leader>sh`                | Split window horizontally                                                       |
| `<leader>q`                 | Close current split                                                             |
| `Ctrl+Arrows`               | Resize current window                                                           |
| `<leader>bn` / `<leader>bp` | Next/previous buffer                                                            |

### Neovim — Files

| Key         | Action                                                     |
| ----------- | ---------------------------------------------------------- |
| `<leader>m` | Toggle Neo-tree                                            |
| `<leader>e` | Focus Neo-tree (or go back to buffer if already inside it) |

### Neovim — Search (fzf-lua)

| Key          | Action                              |
| ------------ | ----------------------------------- |
| `<leader>ff` | Find files                          |
| `<leader>fg` | Live grep across the project        |
| `<leader>fb` | Search open buffers                 |
| `<leader>fh` | Search help tags                    |
| `<leader>fx` | Diagnostics for current file        |
| `<leader>fX` | Diagnostics for the whole workspace |
| `<leader>fs` | Document symbols                    |
| `<leader>fS` | Workspace symbols                   |

### Neovim — LSP

| Key          | Action                                 |
| ------------ | -------------------------------------- |
| `K`          | Show hover documentation               |
| `gd`         | Go to definition                       |
| `gD`         | Go to declaration                      |
| `gR`         | List references                        |
| `gi`         | List implementations                   |
| `gt`         | Go to type definition                  |
| `<leader>ca` | Code actions (normal and visual mode)  |
| `<leader>rn` | Rename symbol                          |
| `<leader>d`  | Show line diagnostic (floating window) |
| `<leader>D`  | Show diagnostics for the whole file    |
| `[d` / `]d`  | Previous/next diagnostic               |
| `<leader>rs` | Restart LSP                            |

### Neovim — Debug (DAP)

| Key          | Action                                          |
| ------------ | ----------------------------------------------- |
| `<leader>tt` | Toggle breakpoint                               |
| `<leader>tc` | Start/continue debug session                    |
| `<leader>tr` | Restart debug session                           |
| `<leader>td` | Disconnect debugger                             |
| `<leader>tq` | Terminate debug session                         |
| `<leader>tn` | Debug nearest test method _(Java buffers only)_ |
| `<leader>tf` | Debug current test class _(Java buffers only)_  |

### Neovim — Help

| Key         | Action                                |
| ----------- | ------------------------------------- |
| `<leader>?` | Show buffer-local keymaps (which-key) |

> Note: `mini.nvim` modules (comment, surround, move, pairs, ai) use each plugin's own default keys (e.g. `gcc` to comment a line) — they are not remapped in this config.

---

### tmux (prefix: `Ctrl+a`)

| Key                           | Action                                |
| ----------------------------- | ------------------------------------- |
| `Ctrl+a c`                    | New window (in current path)          |
| `Ctrl+a \|`                   | Split vertically                      |
| `Ctrl+a -`                    | Split horizontally                    |
| `Ctrl+a r`                    | Reload `tmux.conf`                    |
| `Ctrl+a h/j/k/l` (repeatable) | Resize the active pane                |
| `Ctrl+a m`                    | Zoom current pane                     |
| `Ctrl+a w`                    | Open popup menu                       |
| `Ctrl+a g`                    | Open LazyGit in a popup               |
| `Ctrl+t`                      | Open/close the scratch terminal popup |
| `v` / `y` (copy-mode)         | Start selection / copy selection      |

---

## License

MIT © Felipe Lacerda
