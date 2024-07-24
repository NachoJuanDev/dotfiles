#> Packages <#

# Starship
eval "$(starship init zsh)"

# ruby - rben
eval "$(rbenv init - zsh)"

# Android studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
