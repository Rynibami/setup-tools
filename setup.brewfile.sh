#!/bin/bash

# ============================================================
#   Program Variables
# ============================================================

PROJ_DIR="$CWD"
CONF_DIR="$HOME/.config/brewfile"

DEBG_RUN=""

# ============================================================
#   Program Functions
# ============================================================

# Prints the usage of the script
function usage {
    echo "Usage: ./setup.brewfile.sh [OPTIONS]"
    echo
    echo "Options:"
    echo
    echo "  -h, --help          Show this help message and exit."
    echo "                      Default: [Not set | Don't show Help]"
    echo
    echo "  -d, --dry-run       Only install brew and core packages."
    echo "                      Default: [Not set | Install full brewfile]"
    echo
    echo "  -c, --config-dir    Specify the config directory."
    echo "                      Default: [$HOME/.config/brewfile]"
    echo
    echo "  -p, --project-dir   Specify the project directory."
    echo "                      Default: [$CWD]"
}

# ============================================================
#   Program Entry Point
# ============================================================

set -e

while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            usage
            exit 0
            ;;
        -d|--dry-run)
            DEBG_RUN="--dry-run"
            shift
            ;;
        -c|--config-dir)
            CONF_DIR="$2"
            shift 2
            ;;
        -p|--project-dir)
            PROJ_DIR="$2"
            shift 2
            ;;
        *)
            break
            ;;
    esac
done

echo "[i] Starting Brewfile setup..."

# Install homebrew
if ! command -v brew &> /dev/null; then
    echo " +- [i] Homebrew not installed..."
    echo " +- [i] Homebrew installation process starting..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo " +- [i] Homebrew already installed!"
fi

# Install homebrew core packages
echo " +- [i] Installing core packages..."
brew install dotter
brew install rcmdnk/file/brew-file

# Synchronize the dotter configuration
echo " +- [i] Synchronizing dotter configuration..."
cd ".dotfiles"
dotter deploy
cd ".."

# Run the brewfile(s)
echo " +- [i] Running Brewfile(s) installation process..."
brew file install --file "$CONF_DIR/Brewfile" $DEBG_RUN