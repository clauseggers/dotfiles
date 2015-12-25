#!/bin/bash

# My XRANDR display settings
# These settings needed for `i3` window manager
gtf 2560 1440 60.00
xrandr --newmode "2560x1440_60.00" 311.83  2560 2744 3024 3488  1440 1441 1444 1490  -HSync +Vsync
xrandr --addmode Virtual1 2560x1440_60.00
xrandr --output Virtual1 --mode 2560x1440_60.00

