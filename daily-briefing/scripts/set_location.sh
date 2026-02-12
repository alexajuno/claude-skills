#!/bin/bash
# Set current location
# Usage: set_location.sh <location_key>
# Example: set_location.sh thanhhoa

LOCATION_CONFIG="$HOME/.config/location.json"
KEY="${1:-hanoi}"

if jq -e ".locations[\"$KEY\"]" "$LOCATION_CONFIG" > /dev/null 2>&1; then
    jq ".current = \"$KEY\"" "$LOCATION_CONFIG" > /tmp/loc.json && mv /tmp/loc.json "$LOCATION_CONFIG"
    CITY=$(jq -r ".locations[\"$KEY\"].name" "$LOCATION_CONFIG")
    echo "Location set to: $CITY ($KEY)"
else
    echo "Unknown location: $KEY"
    echo "Available locations:"
    jq -r '.locations | keys[]' "$LOCATION_CONFIG"
    exit 1
fi
