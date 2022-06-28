#!/usr/bin/env bash

# polybar-msg cmd quit
killall -q polybar

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar topbar 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bars asså"

