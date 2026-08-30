#!/usr/bin/env bash
set -euo pipefail

# Keep the fork's established LAN subnet without importing optional package trees.
sed -i 's/192\.168\.1\.1/192.168.10.1/g' package/base-files/files/bin/config_generate
