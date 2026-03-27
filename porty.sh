#!/bin/bash

VERSION="1.1.1"
REMOTE_URL="https://raw.githubusercontent.com/Joanlood/porty/refs/heads/main/porty.sh"
INSTALL_PATH="/usr/local/bin/porty"

# --- Handle Flags ---
if [[ "$1" == "--version" ]]; then
    remote_version=$(curl -fsSL "$REMOTE_URL" 2>/dev/null | grep '^VERSION=' | head -n1 | cut -d'"' -f2)

    if [[ -z "$remote_version" ]]; then
        echo "Porty version $VERSION"
        exit 0
    fi

    if [[ "$remote_version" == "$VERSION" ]]; then
        echo "Porty version $VERSION (Up to date)"
    else
        echo "Porty version $VERSION (Update available: use 'porty --update')"
    fi

    exit 0
fi


if [[ -n "$1" ]] && [[ "$1" != --* ]] ; then
    echo "❌ Error: Unknown option '$1'"
    echo "Use 'porty --help' for available options"
    exit 1
fi

if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
    echo "Porty - Find free ports on your system"
    echo ""
    echo "Usage: porty [OPTION]"
    echo ""
    echo "Options:"
    echo "  --help, -h        Display this help message"
    echo "  --version         Display version information"
    echo "  --update          Update Porty to the latest version"
    echo "  --uninstall       Remove Porty from your system"
    echo ""
    exit 0
fi

if [[ "$1" == "--update" ]]; then
    echo "🔄 Checking for updates..."

    remote_version=$(curl -fsSL "$REMOTE_URL" | grep '^VERSION=' | head -n1 | cut -d'"' -f2)

    if [[ -z "$remote_version" ]]; then
        echo "❌ Failed to fetch remote version"
        exit 1
    fi

    if [[ "$remote_version" == "$VERSION" ]]; then
        echo "✅ Already up to date (v$VERSION)"
        exit 0
    fi

    echo "ℹ New version available: $remote_version (current: $VERSION)"
    echo "⬇ Updating..."

    sudo curl -fsSL -o "$INSTALL_PATH" "$REMOTE_URL"
    sudo chmod +x "$INSTALL_PATH"

    echo "✅ Successfully updated to v$remote_version"
    exit 0
fi

if [[ "$1" == "--uninstall" ]]; then
    echo "📦 Found Porty installation at $INSTALL_PATH"
    echo "🔧 Removing Porty..."
    curl -fsSL https://raw.githubusercontent.com/Joanlood/porty/refs/heads/main/uninstall.sh | bash

    if [[ ! -f "$INSTALL_PATH" ]]; then
        echo "✅ Porty has been successfully uninstalled."
        echo "ℹ️ Clean the Bash Cache with: hash -r"
    else
        echo "❌ Failed to uninstall Porty."
    fi
    exit 0
fi

# --- Main Script Logic Below ---
echo " ____            _
|  _ \ ___  _ __| |_ _   _
| |_) / _ \| '__| __| | | |
|  __/ (_) | |  | |_| |_| |
|_|   \___/|_|   \__|\__, |
                     |___/ "

read -rp "Please enter the starting port (default 1024): " start_port
start_port=${start_port:-1024}

read -rp "Please enter the ending port (default 65535): " end_port
end_port=${end_port:-65535}

read -rp "Please enter the maximum number of results to display (default 5): " max_results
max_results=${max_results:-5}

echo
echo "Using the following settings:"
echo "START_PORT = $start_port"
echo "END_PORT   = $end_port"
echo "MAX_RESULT = $max_results"
echo

count=0

lsof_out=$(sudo lsof -nP -iTCP:"${start_port}-${end_port}" -sTCP:LISTEN 2>/dev/null | awk 'NR>1 {split($9,a,":"); print a[length(a)]}')

for ((port=start_port; port<=end_port; port++)); do
    if ! grep -qx "$port" <<< "$lsof_out"; then
        printf '✅ Port %d is free\n' "$port"
        ((count++))
    fi

    if (( count >= max_results )); then
        break
    fi
done

if (( count == 0 )); then
    echo "❌ Error: No free ports found in the range $start_port-$end_port"
    exit 1
fi
