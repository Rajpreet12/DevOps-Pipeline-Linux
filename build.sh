#!/bin/bash

echo "[+] No dependencies to install for this project."

echo "[+] Creating dist directory..."
mkdir -p dist

echo "[+] Copying project files to dist/..."
cp -r * dist/

echo "[✓] Build complete."

