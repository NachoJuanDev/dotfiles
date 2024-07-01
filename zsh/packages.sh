#> Packages <#

# iterm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Starship
eval "$(starship init zsh)"

# ruby - rben
eval "$(rbenv init - zsh)"

# node - fnm
eval "$(fnm env --use-on-cd)"

# pnpm
export PNPM_HOME="/Users/nacho/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Android studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Docker
export PATH=$PATH:$HOME/.docker/bin

# VSCode - Console Ninja
PATH=~/.console-ninja/.bin:$PATH
