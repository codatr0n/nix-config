#!/usr/bin/env bash
set -euo pipefail
HOST="${1:-thinknix-t480}"
cd "$(dirname "$0")"
sudo nixos-rebuild switch --flake ".#$HOST"
