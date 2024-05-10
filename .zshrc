#> Basic Config <#

export LANG=es_ES.UTF-8
export DOTZSH=$HOME/dotfiles/zsh/

#> Sources <#

# Oh My Zsh
[[ -e $DOTZSH/oh_my_zsh.sh ]] && source $DOTZSH/oh_my_zsh.sh

# Aliases
[[ -e $DOTZSH/aliases.sh ]] && source $DOTZSH/aliases.sh

# Packages
[[ -e $DOTZSH/packages.sh ]] && source $DOTZSH/packages.sh

# Scripts
[[ -e $DOTZSH/scripts.sh ]] && source $DOTZSH/scripts.sh

# Help
[[ -e $DOTZSH/help.sh ]] && source $DOTZSH/help.sh
