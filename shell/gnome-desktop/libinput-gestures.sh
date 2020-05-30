sudo apt install -y xdotool wmctrl libinput-tools

git clone git@github.com:bulletmark/libinput-gestures
cd libinput-gestures/ && sudo make install
rm -rf libinput-gestures

sudo gpasswd -a ${USER} input
libinput-gestures-setup autostart

