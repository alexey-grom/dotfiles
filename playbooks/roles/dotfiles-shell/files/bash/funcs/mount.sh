function automount-this () {
  if [ -z "$1" ]; then
    echo "Usage: automount-this <name>"
    return
  fi
  local device=/dev/$1
  local info=$(lsblk -n -l -o +UUID $device)
  if [ -z "$info" ]; then
    return
  fi
  local uuid=$(echo "$info" | awk '{print $7}')
  if [[ -z "$uuid" ]]; then
    echo "Unknown UUID"
    return
  fi
  local mountpoint=$(mount | grep $device | awk '{print $3}')
  if [[ ! -z "$mountpoint" ]]; then
    echo "Already mounted to $mountpoint"
    cd $mountpoint
    return
  fi
  mountpoint=/media/$uuid/
  [ ! -d "$mountpoint" ] && mkdir $mountpoint
  sudo mount $device $mountpoint
  cd $mountpoint
}

function mount-with-ssh () {
  if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Usage: mount-ssh <server> <path> <mountpoint>"
    return 
  fi
  local server=$1
  local path=$2
  local mountpoint=$3
  [ ! -d "$mountpoint" ] && mkdir "$mountpoint"
  sshfs -o follow_symlinks ${server}:${path} $mountpoint
}

function mount-ramdisk () {
  if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Usage: mount-ramdisk <point> [<size>]"
    return
  fi
  local mountpoint=$1
  local size=${2:-2048M}
  [ ! -d "$mountpoint" ] && mkdir "$mountpoint"
  sudo mount -t tmpfs -o size=$size tmpfs $mountpoint
}
