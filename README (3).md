
# 🧰 Terminal Setup Scripts for Engineers

Cross-platform terminal setup scripts for macOS, Linux, and Windows (WSL2).  
Includes Zsh, Oh My Zsh, Powerlevel10k, and modern CLI tools to create a clean, powerful terminal experience used by DevOps, Cloud Engineers, and Developers.

---

## 📦 What's Included
- **Zsh** with [Oh My Zsh](https://ohmyz.sh/)
- **Powerlevel10k** theme
- **Zsh Plugins**: autosuggestions, syntax highlighting, completions
- **Nerd Font** support (manually installed on Linux/WSL)
- Popular CLI Tools:
  - `fzf`, `bat`, `exa`, `fd`, `ripgrep`, `btop`
  - `tldr`, `jq`, `yq`, `gh`, `awscli`, `kubectl`
- Custom aliases & `.zshrc` configuration

---

## 🚀 Setup Instructions

### macOS
```bash
chmod +x setup-mac.sh
./setup-mac.sh
```

### Linux (Ubuntu/Debian)
```bash
chmod +x setup-linux.sh
./setup-linux.sh
```

### Windows (WSL2 with Ubuntu)
```bash
chmod +x setup-windows.sh
./setup-windows.sh
```

---

## 📝 Notes
- Nerd Fonts are required for proper Powerlevel10k symbols. Install from: https://www.nerdfonts.com/font-downloads
- Run `p10k configure` after installation to personalize your terminal prompt.

---

## 📁 Repository Structure
```
📁 terminal-setup/
├── setup-mac.sh
├── setup-linux.sh
├── setup-windows.sh
└── README.md
```

---

## 🙌 Contributions
Pull requests are welcome! Feel free to suggest or add platform-specific improvements, plugins, or CLI tools.

---

## 🔗 License
MIT License
