function kill-thunar () {
  pkill thunar && pkill Thunar
}

function switch-termite-theme () {
  local P=$(realpath ~)/.config/termite
    if [ -z "$1" ]; then
      echo "Usage: switch-termite-theme <theme>"
      echo "Available themes:"
      ls $P
      return
    fi
  ln -sf $P/$1 $P/config
}

function show-colors () {
  for x in {0..8}; do
      for i in {30..37}; do
          for a in {40..47}; do
              echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
          done
          echo
      done
  done
  echo -e "\e[m"
}

function dump-clipboards () {
  sels=(primary clipboard)
  for sel in "${sels[@]}"; do
    echo
    echo "<$sel>"
    xclip -o -selection $sel
    echo "</$sel>"
    echo
  done
}

function print-hr () {
    echo "$(yes ${1:-*} | head -n$COLUMNS | tr -d '\n')"
}
