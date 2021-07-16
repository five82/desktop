#!/usr/bin/env bash

# dwm autostart script

# ** MANAGED BY ANSIBLE. CHANGES WILL BE OVERWRITTEN. **

lxsession &
picom --experimental-backend &
pcmanfm -d &
nitrogen --restore &
dwmblocks &