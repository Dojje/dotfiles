#!/bin/sh

BLANK='#00000000'

RING='#6c7086'
TEXT='#cdd6f4'
PRESS='#74c7ec'

WRONG='#f38ba8'
VERIFYING='#cba6f7'

i3lock \
--insidever-color=$BLANK \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$BLANK \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$RING \
--line-color=$BLANK          \
--separator-color=$RING \
\
--verif-color=$VERIFYING \
--wrong-color=$WRONG \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$PRESS \
--bshl-color=$PRESS \
\
--screen 1                   \
--blur 5                     \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%Y-%m-%d"       \

