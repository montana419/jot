#!/usr/bin/env bash

# Exit script immediately on error
set -e

# Load environment variables from .env if present
if [ -f .env ]; then
  echo "Loading environment variables from .env..."
  export $(grep -v '^#' .env | xargs)
fi

# Ensure DATABASE_URL is available
if [ -z "$DATABASE_URL" ]; then
  echo "Error: DATABASE_URL environment variable is missing!"
  echo "Please make sure it is defined in your .env file or shell environment."
  exit 1
fi

echo "Connecting to CockroachDB..."

# Execute SQL statements
psql "$DATABASE_URL" << 'EOF'
-- Create employees table
CREATE TABLE IF NOT EXISTS employees (
    id INT8 PRIMARY KEY DEFAULT unique_rowid(),
    client_name VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    role VARCHAR(255) NOT NULL,
    salary NUMERIC DEFAULT 0.0,
    chain_id VARCHAR(50) DEFAULT '1952'
);

-- Create tasks table
CREATE TABLE IF NOT EXISTS tasks (
    id INT8 PRIMARY KEY DEFAULT unique_rowid(),
    client_name VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
    priority VARCHAR(50) DEFAULT 'Medium'
);

-- Confirm created tables
SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';
EOF

echo "Tables initialized successfully!"