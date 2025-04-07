#!/bin/bash

# URL des Skripts
SCRIPT_URL="https://raw.githubusercontent.com/<your-username>/porty/main/porty.sh"
INSTALL_PATH="/usr/local/bin/porty"

# Lade das Skript herunter und installiere es
echo "📥 Downloading porty..."
curl -fsSL $SCRIPT_URL -o $INSTALL_PATH

# Mach das Skript ausführbar
echo "🔧 Making porty executable..."
sudo chmod +x $INSTALL_PATH

# Fertig!
echo "✅ porty has been installed! You can now run it with 'porty'."
