function run-sshuttle () {
  sshuttle -v --dns 0.0.0.0/0 -r $1
}

function get-my-ip () {
    curl -s $@ https://httpbin.org/ip | jq '.origin'
}

function _check-proxy () {
    if [ -z "$2" ]; then
      echo "Usage: check-<proxy|socks4|socks5>-proxy <host:port>"
      return
    fi
    direct=$(get-my-ip)
    withproxy=$(get-my-ip --$1 $2)
    echo "Direct: $direct"
    echo "With proxy: $withproxy"
    if [ -z "$withproxy" ] || [ "$direct" == "$withproxy" ]; then
      echo -e "\e[1;31mBAD\e[m"
    else
      echo -e "\e[1;32mGOOD\e[m"
    fi
}

function check-http-proxy () {
    _check-proxy proxy $1
}

function check-socks4-proxy () {
    _check-proxy socks4 $1
}

function check-socks5-proxy () {
    _check-proxy socks5 $1
}

function run-with-socks5 () {
    if [ -z "$1" ]; then
      echo "Usage: run-with-socks5 <host:port> <command> [<args...>]"
      return
    fi
    SOCKS5_SERVER=$1 socksify ${@:2}
}

function anything-with-proxy () {
    if [ -z "$1" ] || [ -z "$2" ]; then
      echo "Usage: anything-with-proxy <proxy|socks4|socks5> <host:port>"
      return
    fi
    curl -s --$1 $2 http://httpbin.org/anything | jq '.'
}
