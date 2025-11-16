#!/usr/bin/env bash
set -e

echo "=== MongoDB Docker Setup ==="

# Prompt for details
read -rp "Container name [mongodb]: " CONTAINER_NAME
CONTAINER_NAME=${CONTAINER_NAME:-mongodb}

read -rp "Port [27017]: " PORT
PORT=${PORT:-27017}

read -rp "Root username [root]: " ROOT_USER
ROOT_USER=${ROOT_USER:-root}

read -rsp "Root password: " ROOT_PASS
echo
read -rp "Database name [mydatabase]: " DB_NAME
DB_NAME=${DB_NAME:-mydatabase}

read -rp "Admin username [superadmin]: " ADMIN_USER
ADMIN_USER=${ADMIN_USER:-superadmin}

read -rsp "Admin password: " ADMIN_PASS
echo

# Create data volume
VOLUME_NAME="${CONTAINER_NAME}_data"
echo "Creating Docker volume: $VOLUME_NAME"
docker volume create "$VOLUME_NAME" >/dev/null

# Start MongoDB container
echo "Starting MongoDB container..."
docker run -d \
  --name "$CONTAINER_NAME" \
  -p "$PORT":27017 \
  -e MONGO_INITDB_ROOT_USERNAME="$ROOT_USER" \
  -e MONGO_INITDB_ROOT_PASSWORD="$ROOT_PASS" \
  -v "$VOLUME_NAME":/data/db \
  mongo:latest >/dev/null

# Wait for MongoDB to initialize
echo "Waiting for MongoDB to start..."
sleep 10

# Create initialization JavaScript
INIT_SCRIPT=$(mktemp)
cat > "$INIT_SCRIPT" <<EOF
use $DB_NAME;
db.createUser({
  user: "$ADMIN_USER",
  pwd: "$ADMIN_PASS",
  roles: [{ role: "root", db: "admin" }]
});
EOF

# Execute initialization script
echo "Creating admin user..."
docker exec -i "$CONTAINER_NAME" mongosh -u "$ROOT_USER" -p "$ROOT_PASS" --authenticationDatabase admin < "$INIT_SCRIPT" >/dev/null

# Clean up
rm "$INIT_SCRIPT"

echo
echo "✅ MongoDB setup complete!"
echo "----------------------------------------"
echo "Container Name: $CONTAINER_NAME"
echo "Port: $PORT"
echo "Database: $DB_NAME"
echo "Root User: $ROOT_USER"
echo "Admin User: $ADMIN_USER"
echo "Connection String:"
echo "  mongodb://$ADMIN_USER:$ADMIN_PASS@localhost:$PORT/admin"
echo "----------------------------------------"
