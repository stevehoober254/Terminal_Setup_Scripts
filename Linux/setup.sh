#!/bin/bash

echo "🔧 Starting terminal setup for Linux..."

sudo apt update && sudo apt upgrade -y

# Install packages
sudo apt install -y \
  git \
  zsh \
  curl \
  fzf \
  bat \
  exa \
  fd-find \
  ripgrep \
  btop \
  tldr \
  jq \
  yq \
  unzip \
  gh \
  awscli \
  kubectl

# Alias batcat to bat (for Ubuntu)
if ! command -v bat &>/dev/null; then
  echo 'alias bat="batcat"' >> ~/.zshrc
fi

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "📦 Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Plugins
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM}/plugins/zsh-completions

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k

# Nerd Fonts manually
echo "🧠 Please install a Nerd Font manually for best experience: https://www.nerdfonts.com/font-downloads"

# .zshrc
cat <<'EOF' > ~/.zshrc
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)

source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias ll='exa -al --color=always --group-directories-first'
alias cat='bat'
alias findf='fdfind'
alias gs='git status'
alias k='kubectl'

eval "$(fzf --zsh)"
EOF

echo "✅ Setup complete. Run: source ~/.zshrc"
