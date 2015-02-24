#!/bin/bash
# Provisioning for our Virtual Box
# @todo Create conditionals to reduce provisioning time for already
#       installed packages and uploaded files.
source "/srv/scripts/shell_colors${stop}"

echo -e -e "${bwhite}Starting shell provisioning...${stop}"

echo -e -e "${bwhite}Updating packages...${stop}"
sudo apt-get -q update

echo -e "${bwhite}Installing binary tools...${stop}"
sudo apt-get -fy install curl
sudo apt-get -fy install wget
sudo apt-get -fy install git

echo -e "${bwhite}Installing Apache...${stop}"
sudo apt-get -fy install apache2
sudo a2enmod rewrite
sudo service apache2 restart

echo -e "${bwhite}Installing PHP...${stop}"
sudo apt-get -fy install php5
sudo apt-get -fy install php5-mysql
sudo apt-get -fy install php5-curl
sudo apt-get -fy install php5-gd

echo -e "${bwhite}Installing Composer...${stop}" # https://getcomposer.org
sudo curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# @todo Think: WP-CLI has a broad context. Compartmentalizing in each VM
#       with a .yaml context will help unwanted command yet having a broad
#       context on our host (laptop) will allow access to any build we have.
echo -e "${bwhite}Install WP-CLI...${stop}" # http://wp-cli.org/
sudo curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
sudo chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
#echo -e "Upload and source WP-CLI bash file for autocompletes..."
#source ~/scripts/wp-completion.bash
#source ~/.bash_profile

# Errors occurring on reprovisioning.
echo -e "${bwhite}Installing MySQL...${stop}"
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'
sudo apt-get -fy install mysql-server

# Clean up installation environment
echo -e "${bwhite}Clean up...${stop}"
sudo apt-get -y autoremove

# Install the latest version of WordPress (to www)
cd /var/www/
wget http://wordpress.org/latest.tar.gz
tar xvf latest.tar.gz
mkdir wp
mv wordpress/* wp
rmdir wordpress
rm latest.tar.gz

# Notify completion
echo -e "${bwhite}Done!${stop}"
