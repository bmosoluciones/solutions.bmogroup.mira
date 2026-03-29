#!/usr/bin/env bash
# SPDX-License-Identifier: GPL-3.0-or-later
# SPDX-FileCopyrightText: 2025 - 2026 BMO Soluciones, S.A.

set -euo pipefail

FLATPAK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$FLATPAK_DIR"

MANIFEST="solutions.bmogroup.MIRA.yml"
BUILD_DIR="${1:-build-flatpak}"

if ! command -v flatpak >/dev/null 2>&1; then
  echo "Error: flatpak is not installed." >&2
  exit 1
fi

if ! command -v flatpak-builder >/dev/null 2>&1; then
  echo "Error: flatpak-builder is not installed." >&2
  exit 1
fi

if ! flatpak remotes --user --columns=name 2>/dev/null | grep -qx "flathub"; then
  echo "Adding flathub remote..."
  flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

flatpak-builder \
  --user \
  --install-deps-from=flathub \
  --install \
  --force-clean \
  "$BUILD_DIR" \
  "$MANIFEST"

echo ""
echo "Flatpak build/install completed."
echo "Run with: flatpak run solutions.bmogroup.MIRA"
