#!/bin/bash

STATE_FILE="/tmp/battery_toggle_state"

# Parse battery levels and time
BAT0=$(acpi -b | grep 'Battery 0' | awk -F', ' '{print $2}')
BAT1=$(acpi -b | grep 'Battery 1' | awk -F', ' '{print $2}')
MAIN=$(acpi -b | head -n1 | awk -F', ' '{print $2}')
TIME_REMAINING=$(acpi -b | head -n1 | awk -F', ' '{print $3}' | tr -d ' ')

# Click toggles between formats
if [[ "$1" == "click" ]]; then
  if [[ -f "$STATE_FILE" ]]; then
    rm "$STATE_FILE"
  else
    touch "$STATE_FILE"
  fi
fi

# Show individual or combined battery
if [[ -f "$STATE_FILE" ]]; then
  TEXT="BAT0: $BAT0 | BAT1: $BAT1"
else
  TEXT="$MAIN"
fi

# Tooltip is always time remaining
TOOLTIP="$TIME_REMAINING remaining"

# Output JSON
echo "{\"text\": \"$TEXT\", \"tooltip\": \"$TOOLTIP\"}"
