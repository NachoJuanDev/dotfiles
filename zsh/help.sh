function help {
  echo -e "Help\n"

  if [ -f $DOTZSH/scripts.sh ]; then
    echo -e "[*] Scripts"
    cat $DOTZSH/scripts.sh |
      grep -oE '#@.+' |
      awk '{printf "  %-15s : %-15s\n", $2, $3}' FS='#@|#:'
  fi

  if [ -f $DOTZSH/aliases.sh ]; then
    echo -e "\n[*] Aliases"
    cat $DOTZSH/aliases.sh |
      grep -oE '#@.+' |
      awk '{printf "  %-15s : %-15s\n", $2, $3}' FS='#@|#:'
  fi
}
