# install: wine
sudo dpkg --add-architecture i386 && sudo apt update
sudo apt install -y \
      wine \
      wine32 \
      wine64 \
      libwine \
      libwine:i386 \
      fonts-wine





