#!/usr/bin/env bash

# runs one time post install commands

# the xorg server must be up before you can run an xrdb command.
# so this is an inelegant way of doing this until i can come up
# with something better.
xrdb -merge ~/.Xresources

echo "Post install script complete."