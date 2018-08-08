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

function docker-container-fs () {
    container=$1
    docker container inspect -f '{{ .GraphDriver.Data.MergedDir }}' $container
}

function link-docker-container-fs () {
    fs=$(docker-container-fs $container)
    ln -sf $fs ./docker-container
}

# function docker-nvim () {
#     image=$1
#     binary=/usr/bin/nvim
#     share=/usr/share/nvim
#
#     libs_list=(
#         "/usr/lib/x86_64-linux-gnu/libuv.so.1"
#         "/usr/lib/x86_64-linux-gnu/libmsgpackc.so.2"
#         "/usr/lib/x86_64-linux-gnu/libvterm.so.0"
#         "/usr/lib/x86_64-linux-gnu/libtermkey.so.1"
#         "/usr/lib/x86_64-linux-gnu/libunibilium.so.0"
#         "/usr/lib/x86_64-linux-gnu/libluajit-5.1.so.2"
#         "/usr/lib/x86_64-linux-gnu/libjemalloc.so.1"
#         # "/lib/x86_64-linux-gnu/librt.so.1"
#         # "/lib/x86_64-linux-gnu/libpthread.so.0"
#         # "/lib/x86_64-linux-gnu/libnsl.so.1"
#         # "/lib/x86_64-linux-gnu/libdl.so.2"
#         # "/lib/x86_64-linux-gnu/libm.so.6"
#         # "/lib/x86_64-linux-gnu/libutil.so.1"
#         # "/lib/x86_64-linux-gnu/libc.so.6"
#         # "/lib/x86_64-linux-gnu/libgcc_s.so.1"
#     )
#
#     libs=""
#     for lib in "${libs_list[@]}"; do
#         libs+=" -v "
#         libs+="$lib:$lib"
#     done
#
#     # libs=""
#     # for line in $(ldd $binary | cut -d' ' -f3); do
#     #     if [[ -z $line ]]; then continue; fi
#     #     libs+=" -v "
#     #     libs+="$line:$line"
#     # done
#
#     set -x
#     docker run \
#       --rm -it \
#       -e HOME:/ \
#       -u $UID:$UID \
#       -v $binary:$binary \
#       -v $share:$share \
#       $libs \
#       -v $HOME/.config/nvim/:/.config/nvim/ \
#       -v $HOME/.local/share/nvim/:/.local/share/nvim/ \
#       -v $PWD:/src/ \
#       -w /src/ \
#       $image \
#       nvim ${@:2}
#     set +x
# }
