#!/bin/bash -eu
cd $(dirname `realpath $0`)

export DEBIAN_FRONTEND=noninteractive
DOTFILES_REPOS=git@github.com:nobiki/dotfiles

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
    echo -n "${1} ................... "

    spin &
    SPIN_PID=$!
    trap "kill -9 $SPIN_PID" `seq 0 15`

    . ./${1}.sh 1>/dev/null

    echo "Done (${?})"
    kill -9 $SPIN_PID
}

sudo apt-get update

run shell/apt/core
run shell/dotfiles
run shell/locale-ja

run shell/apt/common
run shell/apt/development

# shell/anyenv
# shell/awscli
# shell/bat
# shell/certbot
# shell/chrome
# shell/ctags
# shell/direnv
# shell/docker-ce
# shell/dotfiles
# shell/eslint
# shell/exa
# shell/font
# shell/fzf
# shell/gcloud
# shell/git_find_big
# shell/goenv
# shell/hadolint
# shell/hcat
# shell/helm
# shell/ibus-mozc
# shell/jmeter
# shell/jq
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
# shell/ripgrep
# shell/rsense
# shell/sql-formatter
# shell/stacer
# shell/trans
# shell/vim
# shell/vlc
# shell/wine
# shell/xpanes
# shell/yarn
