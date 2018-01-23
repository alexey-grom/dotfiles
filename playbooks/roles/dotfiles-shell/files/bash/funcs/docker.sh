function -pretty-shell () {
  local home=${1:-/root/}
  local mountpoints=(
    "-v $HOME/.bashrc:$home.bashrc:ro"
    "-v $HOME/.inputrc:$home.inputrc:ro"
    "-v $HOME/.config/bash:$home.config/bash:ro"
    "-v $HOME/.psqlrc:$home.psqlrc:ro"
    "-v $HOME/.liquidpromptrc:$home.liquidpromptrc:ro"
  )
  echo " ${mountpoints[@]} "
}

function -iam () {
  echo " -u $(id -u):$(id -g) "
}

function docker-run () {
  local usage="Usage: docker-run [-i] [-s] [-p] [image] [command]"
  local OPTIND=1
  local parts=(
    "docker run --rm -it"
  )
  local home=
  while getopts "isph" opt; do
    case $opt in
      i)
        parts+=("$(-iam)")
        home="/"
        ;;
      s)
        parts+=("$(-pretty-shell $home)")
        ;;
      p)
        parts+=("-v $(pwd):/app/ -w /app/")
        ;;
      h|*)
        echo $usage
        return
        ;;
    esac
  done
  shift "$((OPTIND-1))"
  parts+=(
    "${1:-python:3}"
    "${@:2}"
  )
  local command="${parts[@]}"
  echo $command
  $command
}

function docker-show-ip-of () {
  docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $1
}

function run-smtp-server () {
  docker run --rm -it -p 25:1025 python python -m smtpd -n -c DebuggingServer 0.0.0.0:1025
}

function docker-logs () {
  docker logs --follow --tail=100 $1
}

function docker-exec () {
  docker exec -it $1 $2
}

function docker-shell () {
  docker-exec $1 /bin/bash
}

function docker-host-ip () {
  ip ro | grep docker0 | awk '{print $NF}'
  # /sbin/ip route|awk '/default/ { print $3 }'
}

function docker-pretty-stats () {
  docker stats --format "table {{.Name}}\t{{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}"
}
