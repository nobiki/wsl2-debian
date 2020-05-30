export DEBIAN_FRONTEND=noninteractive
export COMPOSE_VER=1.25.3

# docker-ce
sudo apt-get install -y apt-transport-https ca-certificates curl wget gnupg2 software-properties-common lsb-release
sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y wget docker-ce

# docker-compose
if [ ! -e /usr/local/bin/docker-compose ]; then
    sudo wget https://github.com/docker/compose/releases/download/${COMPOSE_VER}/docker-compose-Linux-x86_64 -O /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo gpasswd -a ${USER} docker
fi

# ctop
if [ ! -e /usr/local/bin/ctop ]; then
    sudo wget https://github.com/bcicen/ctop/releases/download/v0.7.1/ctop-0.7.1-linux-amd64 -O /usr/local/bin/ctop
    sudo chmod +x /usr/local/bin/ctop
fi

echo "[docker] "`/usr/bin/docker -v`
echo "[docker-compose] "`/usr/local/bin/docker-compose -v`
