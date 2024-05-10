#> Oh My Zsh <#

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Themes - See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dracula"

# Plugins 
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
