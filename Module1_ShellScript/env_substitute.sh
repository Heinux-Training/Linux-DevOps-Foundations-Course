#!/bin/bash

# Check if required arguments are provided
if [ $# -lt 2 ]; then
    echo "Error: Missing required arguments"
    echo "Usage: $0 KEY VALUE [ENV_FILE]"
    echo "Example: $0 DATABASE_HOST localhost .env"
    exit 1
fi

# Input variables
KEY=$1
VALUE=$2
ENV_FILE=${3:-.env}  # Default to .env if not specified

# Check if env file exists
if [ ! -f "$ENV_FILE" ]; then
    echo "Error: File '$ENV_FILE' does not exist"
    exit 1
fi

# Check if KEY exists in file
if grep -q "^${KEY}=" "$ENV_FILE"; then
    # Key exists - replace the value
    sed -i "s|^${KEY}=.*|${KEY}=${VALUE}|" "$ENV_FILE"
    echo "Updated: ${KEY}=${VALUE}"
else
    # Key doesn't exist - append to file
    echo "${KEY}=${VALUE}" >> "$ENV_FILE"
    echo "Added: ${KEY}=${VALUE}"
fi

echo "Success: $ENV_FILE updated"