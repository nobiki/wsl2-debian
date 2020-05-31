sudo rm -rf /usr/local/lib/sql-formatter/
sudo rm -f /usr/local/bin/sql-formatter
sudo mkdir -p /usr/local/lib/sql-formatter/
sudo git clone "https://github.com/jdorn/sql-formatter" /usr/local/lib/sql-formatter
sudo ln -s /usr/local/lib/sql-formatter/bin/sql-formatter /usr/local/bin/sql-formatter
