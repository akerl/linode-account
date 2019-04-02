#!/usr/bin/env bash

set -euo pipefail

URL="https://id-ed25519.pub/groups/strong.txt"

echo "{"
curl -s "$URL" | awk '/^ssh/ {print "\""$3"\": \""$1" "$2"\","}' | sed '$s/,$//'
echo "}"

