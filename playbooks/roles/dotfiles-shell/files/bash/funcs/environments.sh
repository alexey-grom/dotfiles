function add-npm-bin () {
  export PATH="$PATH:$(pwd)/node_modules/.bin"
}

function activate-pyenv () {
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
}
