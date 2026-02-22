#!/bin/bash

# 1. Run your sync script first
# We use the absolute path to be safe
bash ~/.config/calcurse/google_sync.sh

# 2. Launch calcurse in your preferred terminal emulator
# Replace 'foot' with your terminal (e.g., kitty, alacritty, or st)
foot -a calendar-popup -e calcurse
