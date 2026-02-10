#!/usr/bin/env bash
set -euo pipefail

MAIN="DP-2"
SECOND="DP-1"
DISABLED="HDMI-A-1"

get_outputs() {
    kscreen-doctor -o | awk '/Output:/ {print $3}'
}

exists() {
    get_outputs | grep -Fxq "$1"
}

missing=false

for m in "$MAIN" "$SECOND" "$DISABLED"; do
    if ! exists "$m"; then
        echo "❌ Monitor '$m' not found"
        missing=true
    fi
done

if $missing; then
    echo
    echo "Available outputs:"
    get_outputs
    echo "Edit the script and update monitor names."
    exit 1
fi

kscreen-doctor \
output.$MAIN.enable \
output.$MAIN.mode.3840x2160@60 \
output.$MAIN.primary \
output.$MAIN.position.1920,0 \
\
output.$SECOND.enable \
output.$SECOND.mode.1920x1080@60 \
output.$SECOND.position.0,0 \
\
output.$DISABLED.disable
