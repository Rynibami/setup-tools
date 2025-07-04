#!/bin/zsh

CACHE_FUNC=${1}
CACHE_TIME=${3}
CACHE_FILE="$HOME/.cache/starship/custom/${2}.txt"
CACHE_STUB="${4:-*}"

function echo_debug {
    if [[ "$CACHE_DEBG" == "true" ]]; then
        echo "[DEBUG] $*"
    fi
}

function cache_update {
    eval $CACHE_FUNC > "$CACHE_FILE" 2>/dev/null &
}

# Usage
if [[ -z "$CACHE_FUNC" || -z "$CACHE_FILE" || -z "$CACHE_TIME" ]]; then
    echo "Usage: $0 <cache_function> <cache_file> <cache_time_in_seconds>"
    exit 1
fi

# Initially create a new file with the cache function
if [[ ! -f "$CACHE_FILE" ]]; then
    echo_debug "Creating cache file..."
    cache_update
fi

# Set the file modification time and current time
FILE_TIME=$(stat -f "%m" "$CACHE_FILE" 2>/dev/null)
CURR_TIME=$(date +%s)
DIFF_TIME=$((CURR_TIME - FILE_TIME))

# Check if the cache is still valid
if (( $DIFF_TIME > $CACHE_TIME )); then
    echo_debug "Updating cache file..."
    cache_update
fi

# Print the cached data
CACHE_DATA="$(cat "$CACHE_FILE" 2>/dev/null)"

# Print an asterisk if the cache is empty
if [[ -z "$CACHE_DATA" ]]; then
    echo "${CACHE_STUB}"
    exit 0
fi

# Print the available cached data
echo "$CACHE_DATA"