function run-iso-with-qemu-and-ssh () {
  qemu-system-x86_64 \
    -enable-kvm \
    -cdrom $1 \
    -soundhw ac97 \
    -display sdl \
    -smp 2 \
    -net nic -net user,hostfwd=tcp::2222-:22 \
    -m 2048 ${@:2}
}

function run-iso-with-qemu () {
  qemu-system-x86_64 \
    -enable-kvm \
    -cdrom $1 \
    -soundhw ac97 \
    -display sdl \
    -smp 2 \
    -net nic -net user \
    -m 2048 ${@:2}
}
