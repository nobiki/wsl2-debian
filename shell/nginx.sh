sudo apt install -y nginx

sudo sed -i -e "s/var\/www\/html/var\/virtualdomains\/localhost/g" /etc/nginx/sites-available/default
sudo mkdir -p /var/virtualdomains/localhost
sudo chown -R 1000 /var/virtualdomains
echo "^o^" > /var/virtualdomains/localhost/index.html
