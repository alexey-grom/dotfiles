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

function mount-loop () {
  if [ -z "$1" ]; then
    echo "Usage: mount-loop <filename>"
    return
  fi
  local filename=$1
  local mountpoint="${filename}-mounted"
  [ ! -d "$mountpoint" ] && mkdir "$mountpoint"
  sudo mount ${@:2} -o loop "$filename" "$mountpoint"
}

function mount-loop-rw () {
  if [ -z "$1" ]; then
    echo "Usage: mount-loop-rw <filename>"
    return
  fi
  local filename=$1
  local mountpoint="${filename}-mounted"
  [ ! -d "$mountpoint" ] && mkdir "$mountpoint"
  sudo mount ${@:2} -o loop,rw,sync "$filename" "$mountpoint"
}

function create-disk-image () {
    local timestamp=$(date -u --iso-8601=seconds | sed 's/[^0-9]//g')
    local size=${1:-512M}
    local filename=${2:-disk-${timestamp}.img}
    fallocate -l $size $filename
    sudo mkfs.vfat -v $filename > /dev/null 2>&1
    echo $filename
}

function cleanup-chroot-mounts () {
  if [ -z "$1" ]; then
    echo "Usage: cleanup-chroot-mounts <path>"
    return
  fi
  path=$(realpath $1)
  points=(proc sys dev run)
  for point in "${points[@]}"; do
    mount --make-rprivate "$path/$point" 2>/dev/null || true
  done
  echo "before:"
  grep $path /proc/mounts | \
    cut -d' ' -f2 | \
    sort -r 
  grep $path /proc/mounts | \
    cut -d' ' -f2 | \
    sort -r | \
    xargs -I{} /bin/sh -c "umount -R {} 2>/dev/null || true"
  echo "after:"
  grep $path /proc/mounts | \
    cut -d' ' -f2 | \
    sort -r 
}
