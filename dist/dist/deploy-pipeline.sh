#!/bin/bash

set -e  # Exit on error
set -o pipefail

REPO_DIR="$HOME/mini-devops/DeVOps-Pipeline-Linux/"
REMOTE_USER="ec2-user"                    # Usually ec2-user for Amazon Linux
REMOTE_HOST="34.226.121.28"                # Correct public IP
REMOTE_PATH="/var/www/html"
KEY_PATH="/Users/elahigill/Downloads/devops.pem"          # Change to your actual PEM file path

echo "[*] Starting deployment: $(date)"

echo "[1/4] Navigating to project directory..."
cd "$REPO_DIR"

echo "[2/4] Pulling latest code..."
git pull origin main

echo "[3/4] Running build script..."
./build.sh

echo "[4/4] Deploying with rsync..."
rsync -avz -e "ssh -i $KEY_PATH" --delete "$REPO_DIR/dist/" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH"

echo "[✓] Deployment complete at $(date)"

