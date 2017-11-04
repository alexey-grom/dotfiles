function generate-password () {
  < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;
}

function gpg-encrypt () {
    gpg -o - --cipher-algo AES -a -c $1
}

function gpg-decrypt () {
    gpg -o - -d $1
}

