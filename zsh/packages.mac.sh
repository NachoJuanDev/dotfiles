#> Packages Mac <#

# iterm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

 # node - fnm
eval "$(fnm env --use-on-cd)"

# rails
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export DISABLE_SPRING=true

# libpq - brew
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# google cloud sdk
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

# pnpm
export PNPM_HOME="/Users/nacho/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Docker
export PATH=$PATH:$HOME/.docker/bin
