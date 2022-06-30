sudo apt -q update
sudo apt -q full-upgrade -y
sudo apt -q install apache2 php php-{common,mysql,xml,xmlrpc,curl,gd,imagick,cli,dev,imap,mbstring,opcache,soap,zip,intl} wget unzip -y
wget https://wordpress.org/latest.zip
unzip latest.zip
sudo mv wordpress/ /var/www/html/
sudo chown www-data:www-data -R /var/www/html/wordpress/
sudo chmod -R 755 /var/www/html/wordpress/
sudo echo "<VirtualHost *:80>



ServerAdmin contact@konexio.eu



DocumentRoot /var/www/html/wordrpess

ServerName example.com

ServerAlias www.example.com



<Directory /var/www/html/wordpress/>



Options FollowSymLinks

AllowOverride All

Require all granted



</Directory>




</VirtualHost>

" > /etc/apache2/sites-available/wordpress.conf

sudo a2ensite wordpress.conf
sudo a2enmod rewrite
sudo a2dissite 000-default.conf
sudo service apache2 restart
