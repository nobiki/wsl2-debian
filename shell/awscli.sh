DIR=/usr/local/src/
sudo mkdir -p /usr/local/src/
sudo curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "/usr/local/src/awscli-bundle.zip"
sudo unzip /usr/local/src/awscli-bundle.zip -d /usr/local/src/
sudo /usr/local/src/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
