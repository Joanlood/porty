#!/bin/bash

VERSION="1.0.3"
REMOTE_URL="https://raw.githubusercontent.com/Joanlood/porty/main/porty.sh"
INSTALL_PATH="/usr/local/bin/porty"

# --- Handle Flags ---
if [[ "$1" == "--version" ]]; then
    echo "Porty version $VERSION"
    exit 0
fi

if [[ "$1" == "--update" ]]; then
    echo "🔄 Checking for updates..."
    sudo curl -s -o $INSTALL_PATH $REMOTE_URL
    sudo chmod +x $INSTALL_PATH
    echo "✅ Porty updated from remote repository!"
    exit 0
fi

if [[ "$1" == "--uninstall" ]]; then
    echo "📦 Found Porty installation at $INSTALL_PATH"
    echo "🔧 Removing Porty..."
    sudo rm -f "$INSTALL_PATH"

    echo "🔧 Cleaning up unnecessary packages..."
    sudo apt-get autoremove -y

    if [[ ! -f "$INSTALL_PATH" ]]; then
        echo "✅ Porty has been successfully uninstalled."
    else
        echo "❌ Failed to uninstall Porty."
    fi
    exit 0
fi

# --- Main Script Logic Below ---
echo "Please enter the starting port (default 1024):"
read START_PORT
START_PORT=${START_PORT:-1024} 

echo "Please enter the ending port (default 65535):"
read END_PORT
END_PORT=${END_PORT:-65535}  

echo "Please enter the maximum number of results to display (default 5):"
read MAX_RESULTS
MAX_RESULTS=${MAX_RESULTS:-5}  

  
echo "Using the following settings:"
echo "START_PORT = $START_PORT"
echo "END_PORT = $END_PORT"
echo "MAX_RESULTS = $MAX_RESULTS"

COUNT=0

for ((port=$START_PORT; port<=$END_PORT; port++)); do
  if ! sudo lsof -i :$port &>/dev/null; then
    echo "✅ Port $port is free"
    ((COUNT++))
  fi

  if [ "$COUNT" -ge "$MAX_RESULTS" ]; then
    break
  fi
done
