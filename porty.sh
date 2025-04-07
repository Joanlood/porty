#!/bin/bash

VERSION="1.0.0"
REMOTE_URL="https://raw.githubusercontent.com/Joanlood/porty/main/porty.sh"

if [ "$1" == "--update" ]; then
    echo "🔄 Checking for updates..."
    sudo curl -s -o /usr/local/bin/porty $REMOTE_URL
    sudo chmod +x /usr/local/bin/porty
    echo "✅ porty updated from remote repository!"
    exit 0
fi

# --- Main Script Logic Below ---
echo "🚀 porty v$VERSION is running!"

# Example: Show 5 free ports
START_PORT=1024
END_PORT=65535
MAX_RESULTS=5
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
