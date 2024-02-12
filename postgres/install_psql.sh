#!/bin/bash
# Define variables
PSQL_VERSION="16"
ALLOWED_NETWORK="0.0.0.0/0"
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
echo "host    all             all             $ALLOWED_NETWORK             md5" | sudo tee -a /etc/postgresql/$PSQL_VERSION/main/pg_hba.conf

# Updating postgresql.conf
echo "listen_addresses = '*'" | sudo tee -a /etc/postgresql/$PSQL_VERSION/main/postgresql.conf

# Restarting service PostgreSQL
sudo service postgresql restart

# Firewall configuration (Firewalld)
echo "Configuring firewall"
sudo service ufw start
sudo ufw allow from any to any port 5432 proto tcp
sudo service ufw restart

# Installed psql
echo "========== FINISHED INSTALLATION =========="
echo "PostgreSQL has been installed. Version: $PSQL_VERSION, Guest-Allowed: $ALLOWED_NETWORK"
echo "========================================="