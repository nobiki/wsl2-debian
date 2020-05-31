sudo apt-get install -y locales dialog
sudo locale-gen ja_JP.UTF-8
sudo localedef -f UTF-8 -i ja_JP ja_JP
sudo update-locale LANG=ja_JP.UTF-8
