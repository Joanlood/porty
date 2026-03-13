#!/bin/bash

clear

SCRIPT_URL="https://raw.githubusercontent.com/Joanlood/porty/main/porty.sh"
INSTALL_PATH="/usr/local/bin/porty"

echo "
 ____            _                   _____                ____            _
|  _ \ ___  _ __| |_ _   _          |  ___| __ ___  ___  |  _ \ ___  _ __| |_
| |_) / _ \| '__| __| | | |  _____  | |_ | '__/ _ \/ _ \ | |_) / _ \| '__| __|
|  __/ (_) | |  | |_| |_| | |_____| |  _|| | |  __/  __/ |  __/ (_) | |  | |_
|_|   \___/|_|   \__|\__, |         |_|  |_|  \___|\___| |_|   \___/|_|   \__|
                     |___/
 ____
/ ___|  ___ __ _ _ __  _ __   ___ _ __
\___ \ / __/ _' |  _ \|  _ \ / _ \ '__|
 ___) | (_| (_| | | | | | | |  __/ |
|____/ \___\__,_|_| |_|_| |_|\___|_|
     --- Made by Joanlood --- "

echo "📥 Downloading porty..."
curl -fsSL $SCRIPT_URL -o $INSTALL_PATH

echo "🔧 Making porty executable..."
sudo chmod +x $INSTALL_PATH

echo "✅ porty has been installed! You can now run it with 'porty'."
