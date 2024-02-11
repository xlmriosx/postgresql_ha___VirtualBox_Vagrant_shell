#!/bin/bash
# Create the file repository configuration:
sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Import the repository signing key:
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Update the package lists:
sudo apt-get update

# Install the latest version of PostgreSQL.
# If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql':
sudo apt-get -y install postgresql

# Updating PostgreSQL pg_hba.conf
echo "host    all             all             0.0.0.0/0             md5" | sudo tee -a /etc/postgresql/16/main/pg_hba.conf

# Updating postgresql.conf
echo "listen_addresses = '*'" | sudo tee -a /etc/postgresql/16/main/postgresql.conf

# Restarting service PostgreSQL
sudo service postgresql restart

# Firewall configuration (Firewalld)
echo "Configuring firewall"
sudo service ufw start
sudo ufw allow from any to any port 5432 proto tcp
sudo service ufw restart
