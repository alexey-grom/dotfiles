function dlein-defaults () {
  home=/app/
  echo """
    --rm -it \
    $(-iam) \
    $(-pretty-shell $home) \
    -v $(pwd):/app/ \
    -w /app/ \
    -e HOME=/app/ \
  """
}

function dlein () {
  version=${DLEIN_VERSION:-latest}
  # if variable is set then using host network, else default
  network=${DLEIN_HOST_NETWORK-default}
  network=${network:-host}

  local name=clojure-`datetime-stamp`
  container=`docker run -d \
    --name=${name} \
    $(dlein-defaults) \
    --network=${network} \
    clojure:$version \
    lein ${@}
  `
  ip=`docker-show-ip-of $name`

  if [[ -z ${DLEIN_NOBANNER+x} ]]; then
      print-hr -
      echo "id:   $container"
      echo "name: $name"
      echo "ip:   ${ip:-$(docker-host-ip)}"
      print-hr -
  fi

  docker attach $container

}

function dlein-repl () {
  dlein repl ${@}
}

function dlein-repl-server () {
  dlein repl :start :host 0.0.0.0 ${@}
}

function dlein-tutor () {
  dlein help tutorial | less
}
