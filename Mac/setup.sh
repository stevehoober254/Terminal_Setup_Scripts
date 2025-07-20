#!/bin/bash

echo "🚀 Starting terminal setup..."

# Install Homebrew
if ! command -v brew &>/dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "🔄 Updating Homebrew..."
brew update

# Essential CLI tools
brew install \
  git \
  zsh \
  fzf \
  bat \
  exa \
  fd \
  ripgrep \
  btop \
  tldr \
  zoxide \
  jq \
  yq \
  lazygit \
  gh \
  awscli \
  kubectl

# Powerlevel10k
brew install romkatv/powerlevel10k/powerlevel10k

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "🧠 Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Zsh Plugins
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM}/plugins/zsh-completions

# Fonts
echo "🔤 Installing Nerd Fonts..."
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font

# Zsh Configuration
echo "🧩 Setting up .zshrc..."

cat <<'EOF' > ~/.zshrc
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)

source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases
alias ll='exa -al --color=always --group-directories-first'
alias cat='bat'
alias findf='fd'
alias gs='git status'
alias k='kubectl'

# Tools
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

# Others
export PATH="/opt/homebrew/bin:$PATH"
EOF

echo "🎨 Done. Launch a new terminal or run: source ~/.zshrc"
echo "👉 Use \`p10k configure\` to customize Powerlevel10k theme."

