export JMETER_VER=5.2.1

sudo mkdir -p /usr/local/src/jmeter/
sudo wget "http://ftp.riken.jp/net/apache/jmeter/binaries/apache-jmeter-${JMETER_VER}.tgz" -O /usr/local/src/jmeter/apache-jmeter-${JMETER_VER}.tgz
sudo tar zxvf /usr/local/src/jmeter/apache-jmeter-${JMETER_VER}.tgz -C /usr/local/lib/
sudo chown -R 1000 /usr/local/lib/apache-jmeter-${JMETER_VER}/
echo "PATH=${PATH}:/usr/local/lib/apache-jmeter-${JMETER_VER}/bin/" >> ~/.bash_profile
echo 'export JVM_ARGS="-Duser.language=ja -Dawt.useSystemAAFontSettings=lcd"' >> ~/.bash_profile
