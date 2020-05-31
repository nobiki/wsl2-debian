sudo apt-get install -y bsdmainutils gawk
sudo git clone "https://github.com/soimort/translate-shell" /tmp/translate-shell
sudo make -C /tmp/translate-shell
sudo make -C /tmp/translate-shell install
