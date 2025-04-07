#!/bin/bash

INSTALL_PATH="/usr/local/bin/porty"

if [[ -f "$INSTALL_PATH" ]]; then
    echo "📦 Found Porty installation at $INSTALL_PATH"
    echo "🔧 Removing Porty..."

    # Entferne das Skript
    sudo rm "$INSTALL_PATH"

    echo "✅ Porty has been successfully uninstalled."
else
    echo "❌ Porty is not installed at $INSTALL_PATH"
    echo "Nothing to uninstall."
fi

echo "🔧 Cleaning up unnecessary packages..."
sudo apt-get autoremove -y

if [[ ! -f "$INSTALL_PATH" ]]; then
    echo "✅ Porty has been uninstalled."
else
    echo "❌ Failed to uninstall Porty."
fi
