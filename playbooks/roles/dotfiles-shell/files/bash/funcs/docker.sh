function docker-run-with-pwd () {
  docker run --rm -it -v $(pwd):/app/ -w /app/ ${1:-python:3} ${2:-/bin/bash}
}

function docker-show-ip-of () {
  docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $1
}
