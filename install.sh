#!/bin/bash

SCRIPT_URL="https://raw.githubusercontent.com/Joanlood/porty/main/porty.sh"
INSTALL_PATH="/usr/local/bin/porty"

echo "📥 Downloading porty..."
curl -fsSL $SCRIPT_URL -o $INSTALL_PATH

echo "🔧 Making porty executable..."
sudo chmod +x $INSTALL_PATH

echo "✅ porty has been installed! You can now run it with 'porty'."
