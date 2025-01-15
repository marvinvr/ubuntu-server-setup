#!/bin/bash

# Exit on error
set -e

echo "Setting up ZSH..."

# Install ZSH
if ! command -v zsh &> /dev/null; then
    sudo apt-get install zsh -y
fi

# Install Oh-My-ZSH
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# Add plugin to zshrc
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/' ~/.zshrc

# Create theme
cat > ~/.oh-my-zsh/custom/themes/mvr.zsh-theme << 'EOL'
PROMPT='%(!.%{%F{yellow}%}.)$USER%{$fg_bold[red]%}@%{$reset_color%}%{$fg[white]%}%M %{$fg_bold[red]%}➜%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}% %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
EOL

# Set theme and auto-updates
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="mvr"/' ~/.zshrc
echo 'zstyle ':omz:update' mode auto' >> ~/.zshrc

# Change default shell to zsh
sudo chsh -s $(which zsh) $USER

echo "ZSH setup complete!"