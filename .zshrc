#> Basic Config <#

export LANG=es_ES.UTF-8
export DOTZSH=$HOME/dotfiles/zsh/

# History - Reference: https://github.com/rothgar/mastering-zsh/blob/master/docs/config/history.md
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY            # append to history file
setopt HIST_NO_STORE             # Don't store history commands

# Brew
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

#> Sources <#

# Oh My Zsh
[[ -e $DOTZSH/oh_my_zsh.sh ]] && source $DOTZSH/oh_my_zsh.sh

# Aliases
[[ -e $DOTZSH/aliases.sh ]] && source $DOTZSH/aliases.sh

# Packages
[[ -e $DOTZSH/packages.sh ]] && source $DOTZSH/packages.sh

# Scripts
[[ -e $DOTZSH/scripts.sh ]] && source $DOTZSH/scripts.sh

# Pulso scripts
[[ -e $DOTZSH/pulso_scripts.sh ]] && source $DOTZSH/pulso_scripts.sh

# Help
[[ -e $DOTZSH/help.sh ]] && source $DOTZSH/help.sh
