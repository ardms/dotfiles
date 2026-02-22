#!/bin/bash

# 1. Your Google Calendar iCal URL
URL_DIMOPOULOS="https://calendar.google.com/calendar/ical/dimopoulos%40gmail.com/public/basic.ics"

URL_MAZERIDES="https://calendar.google.com/calendar/ical/39u71ebg25uka740ct48efb7qk%40group.calendar.google.com/public/basic.ics"

# 2. Download the latest calendar file
curl -s -o /tmp/google_cal_dimopoulos.ics "$URL_DIMOPOULOS"
curl -s -o /tmp/google_cal_mazerides.ics "$URL_MAZERIDES"

# Backup and clear current appointments to prevent duplicates
cp ~/.local/share/calcurse/apts ~/.local/share/calcurse/apts.bak
cat /dev/null > ~/.local/share/calcurse/apts

# 3. Import it into calcurse (non-interactively)
# Note: This adds new events; it doesn't delete old ones automatically.
calcurse -i /tmp/google_cal_dimopoulos.ics
calcurse -i /tmp/google_cal_mazerides.ics
