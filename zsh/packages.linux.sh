#> Packages Linux <#

# node - fnm
FNM_PATH="/home/dev/.local/share/fnm"
if [[ -d "$FNM_PATH" ]]; then
  export PATH="/home/dev/.local/share/fnm:$PATH"
  eval "$(fnm env --use-on-cd)"
fi

# python - pipx
export PATH="$PATH:/home/dev/.local/bin"

# gh
eval "$(gh completion -s zsh)"
