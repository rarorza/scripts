#!/usr/bin/env bash
set -euo pipefail

MAIN="HDMI-A-1"
DISABLED_1="DP-1"
DISABLED_2="DP-2"

get_outputs() {
    kscreen-doctor -o | awk '/Output:/ {print $3}'
}

exists() {
    get_outputs | grep -Fxq "$1"
}


missing=false

for m in "$MAIN" "$DISABLED_1" "$DISABLED_2"; do
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
output.$DISABLED_1.disable \
output.DISABLED_2.disable
