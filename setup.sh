#!/bin/bash -eu
cd $(dirname `realpath $0`)

export HERE=${PWD}
export DEBIAN_FRONTEND=noninteractive
export DOTFILES_REPOS=git@github.com:nobiki/dotfiles

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
    trap catch `seq 0 15`

    logfile=${HERE}/log/$(echo ${1} | rev | cut -d '/' -f1 | rev).log
    sh ./${1}.sh 1>${logfile} 2>${logfile}

    echo "Done"
    if [ -x /proc/$SPIN_PID ];then kill -9 $SPIN_PID;fi
}

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
run shell/yarn

run shell/bat
run shell/exa
run shell/hcat
run shell/jq
run shell/ripgrep
run shell/xpanes

run shell/certbot




run shell/apt/development

# shell/awscli
# shell/ctags
# shell/docker-ce
# shell/eslint
# shell/gcloud
# shell/git_find_big
# shell/goenv
# shell/hadolint
# shell/helm
# shell/jmeter
# shell/js-beautify
# shell/locale-ja
# shell/nginx
# shell/ngrok
# shell/nodenv
# shell/phpcs
# shell/phpenv
# shell/postman
# shell/pyenv
# shell/rbenv
# shell/rsense
# shell/sql-formatter
# shell/stacer
# shell/trans
# shell/vim
