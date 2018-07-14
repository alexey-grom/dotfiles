# gtagslabel=ctags
gtagslabel=pygments

# function gtags--check-config () {
#     [[ -f $config ]] && return;
# }

function gtags--index-container () {
    container=$1
    indexdb=$(pwd)/.gtags/container/
    fs=$(docker-container-fs $container)
    config=${HOME}/.globalrc

    # gtags--check-config

    sudo rm -r $indexdb
    mkdir -p $indexdb
    sudo /bin/bash -c "cd $fs; gtags -v \
         --skip-unreadable \
         --gtagslabel=$gtagslabel \
         --gtagsconf=$config \
         $indexdb"
    sudo chmod -R a+r $indexdb

    echo "$container" > $indexdb/name
}

function gtags--index () {
    indexdb=$(pwd)/.gtags/src/
    config=${HOME}/.globalrc

    # gtags--check-config

    mkdir -p $indexdb
    gtags -v \
         --skip-unreadable \
         --gtagslabel=$gtagslabel \
         --gtagsconf=$config \
         $indexdb
}

function gtags--watch () {
    indexdb=$(pwd)/.gtags-index
    config=${HOME}/.globalrc

    # gtags--check-config

    mkdir -p $indexdb

    gtags -v \
          --skip-unreadable \
          --gtagslabel=$gtagslabel \
          --gtagsconf=$config \
          -u \
          $indexdb

}
