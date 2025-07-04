#!/bin/bash

# ============================================================
#   Program Entry Point
# ============================================================

set -e

# Install command line tools
if ! xcode-select -p >/dev/null 2>&1; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
else
    echo "Xcode Command Line Tools are already installed."
fi

# Install rosetta (if on Apple Silicon)
if [[ "$(uname -m)" == "arm64" ]]; then
    if ! /usr/bin/pgrep oahd >/dev/null 2>&1; then
        echo "Installing Rosetta..."
        /usr/sbin/softwareupdate --install-rosetta --agree-to-license
    else
        echo "Rosetta is already installed."
    fi
fi

# Install newest macOS updates
if ! softwareupdate --list | grep -q "No new software available."; then
    echo "Installing macOS updates..."
    sudo softwareupdate --install --all
else
    echo "No new macOS updates available."
fi