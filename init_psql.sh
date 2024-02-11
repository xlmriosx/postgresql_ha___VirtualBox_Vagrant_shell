
#!/bin/bash
# ============== DEFINE VARIABLES ==============
# Database name
DB_NAME="main_db"
# PostgreSQL username
DB_USER="db_user"
# Subnet or IP address from which access will be allowed
ALLOWED_NETWORK="0.0.0.0/0"
# Password for the PostgreSQL user
DB_PASSWORD="db_user"
# ==============================================

# Setting a password for the postgres user
echo "Setting password for postgres user"
cd /
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'Verysecurepass1';"

# Creating a new PostgreSQL database
echo "Creating a new PostgreSQL database"
sudo -u postgres createdb main_db

# Creating a new PostgreSQL user and granting access to the database
echo "Creating a new PostgreSQL user and granting access to the database"
sudo -u postgres psql -c "CREATE USER db_user WITH PASSWORD 'db_user';"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE main_db TO db_user;"

# Print finished aprivison
echo "========== FINISHED APROVISION =========="
echo "PostgreSQL access has been configured. Database: $DB_NAME, User: $DB_USER, Allowed Network: $ALLOWED_NETWORK"
echo "========================================="
