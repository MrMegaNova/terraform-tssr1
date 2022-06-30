sudo apt -q update
sudo DEBIAN_FRONTEND=noninteractive apt -qq full-upgrade -y
sudo DEBIAN_FRONTEND=noninteractive apt -qq install mariadb-server mariadb-client -y
