#!/bin/bash

# spotifyd notifications

# Keeping this for reference but spotifyd player events that
# trigger notifications are too buggy to use yet

# ** MANAGED BY ANSIBLE. CHANGES WILL BE OVERWRITTEN. **

# Add the following line to your spotifyd.conf file:
# onevent = "~/.config/spotifyd/spotifyd-notifications.sh"

if [ "$PLAYER_EVENT" = "change" ] || [ "$PLAYER_EVENT" = "play" ]; then
  trackName=$(playerctl metadata title)
  artistAndAlbumName=$(playerctl metadata --format "{{ artist }} ({{ album }})")
  coverArtUrl=$(playerctl metadata mpris:artUrl)
  coverArtFile="/tmp/$(playerctl metadata mpris:artUrl | awk -F/ '{print $5}')"
  if [ ! -e "$coverArtFile" ]; then
    wget -P /tmp "$coverArtUrl"
  fi
  notify-send -u low -i "$coverArtFile" "$trackName" "$artistAndAlbumName "
fi