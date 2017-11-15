function -pretty-shell () {
  local mountpoints=(
    "-v $HOME/.bashrc:/root/.bashrc:ro"
    "-v $HOME/.inputrc:/root/.inputrc:ro"
    "-v $HOME/.config/bash:/root/.config/bash:ro"
    "-v $HOME/.psqlrc:/root/.psqlrc:ro"
    "-v $HOME/.liquidpromptrc:/root/.liquidpromptrc:ro"
  )
  echo " ${mountpoints[@]} "
}

function -iam () {
  echo " -u $(id -u):$(id -g) "
}

function docker-run-with-pwd () {
  docker run --rm -it $(-iam) -v $(pwd):/app/ -w /app/ ${1:-python:3} ${2:-/bin/bash}
}

function docker-show-ip-of () {
  docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $1
}
