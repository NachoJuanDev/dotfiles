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

function help-tmux {
  echo -e "[*] Tmux cheat sheet\n"
  
  echo -e "  * Sessions:"
  echo -e "    tmux new [-s <name session>]"
  echo -e "    tmux a [-t <name session>]"
  echo -e "    tmux kill-session -t <name session>"
  echo -e "    <prefix>, d : detach"
  echo -e "    <prefix>, 0-9 : select session"
  echo -e "    <prefix>, w : list sessions (and windows)"
  
  echo -e ""

  echo -e "  * Panes:"
  echo -e "    <prefix>, % : split vertically"
  echo -e "    <prefix>, \" : split horizontally"
  echo -e "    <prefix>, x : kill pane"
  echo -e "    <prefix>, [left|right|up|down] : change pane"
  echo -e "    <prefix>, { : move pane to left"
  echo -e "    <prefix>, } : move pane to right"
  echo -e "    <prefix>, q : show index and move per index"
  echo -e "    C-h : select pane L"
  echo -e "    C-j : select pane D"
  echo -e "    C-k : select pane U"
  echo -e "    C-l : select pane R"

  echo -e ""

  echo -e "  * Windows:"
  echo -e "    <prefix>, c : new window"
  echo -e "    <prefix>, , : rename window"
  echo -e "    <prefix>, n : next window"
  echo -e "    <prefix>, p : previous window"
  echo -e "    <prefix>, & : close window"
  echo -e "    <prefix>, w : list windows (and sessions)"

}