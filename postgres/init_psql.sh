
#!/bin/bash
# Define variables
DB_NAME="main_db"
DB_PASSWORD_ROOT="Verysecurepass1"
DB_USER="db_user"
DB_PASSWORD="db_user"
# Setting a password for the postgres user
echo "Setting password for postgres user"
cd /
sudo -u postgres psql -c "ALTER USER postgres PASSWORD '$DB_PASSWORD_ROOT';"

# Creating a new PostgreSQL database
echo "Creating a new PostgreSQL database"
sudo -u postgres createdb $DB_NAME

# Creating a new PostgreSQL user and granting access to the database
echo "Creating a new PostgreSQL user and granting access to the database"
sudo -u postgres psql -c "CREATE USER $DB_USER WITH PASSWORD '$DB_PASSWORD';"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;"

# Print finished aprivison
echo "========== FINISHED APROVISION =========="
echo "PostgreSQL access has been configured. Database: $DB_NAME, User: $DB_USER"
echo "========================================="
