#!/bin/bash -eu
cd $(dirname `realpath $0`); export HERE=${PWD}

export DEBIAN_FRONTEND=noninteractive
export DOTFILES_REPOS=git@github.com:nobiki/dotfiles
export VIM_REPOS=git@github.com:nobiki/vim

function spin() {
    spinner="/|\\-/|\\-"
    while :
    do
        for i in `seq 0 7`
        do
            echo -n "${spinner:$i:1}"
            echo -en "\010"
            sleep 0.1
        done
    done
}

function run() {
    catch () {
        if [ -x /proc/$SPIN_PID ];then kill -9 $SPIN_PID;fi
        echo "Error ---> See: ${logfile}"
    }

    echo -n "${1} ................... "

    spin &
    SPIN_PID=$!
    trap catch `seq 1 15`

    logfile=${HERE}/log/$(echo ${1} | rev | cut -d '/' -f1 | rev).log
    sh ./${1}.sh 1>${logfile} 2>${logfile}

    echo "Done"
    if [ -x /proc/$SPIN_PID ];then kill -9 $SPIN_PID;fi
}

sudo echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /tmp/${USER} \
  && sudo install -o root -g root -m 400 /tmp/${USER} /etc/sudoers.d/${USER}

sudo apt-get update

run shell/apt/core
run shell/dotfiles
run shell/locale-ja
run shell/fzf

run shell/ibus-mozc
run shell/font

run shell/chrome
run shell/vlc
run shell/wine

run shell/apt/common

run shell/anyenv
run shell/direnv
run shell/phpenv
run shell/pyenv
run shell/yarn

run shell/bat
run shell/exa
run shell/hcat
run shell/jq
run shell/ripgrep
run shell/xpanes

run shell/apt/development

run shell/ctags
run shell/phpcs
run shell/rsense
run shell/hadolint
run shell/js-beautify
run shell/sql-formatter
run shell/git_find_big

run shell/trans
run shell/stacer

run shell/certbot
run shell/ctop
run shell/helm
