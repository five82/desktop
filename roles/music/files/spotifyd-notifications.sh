#!/bin/bash

# spotifyd notifications

# ** MANAGED BY ANSIBLE. CHANGES WILL BE OVERWRITTEN. **

# Add the following line to your spotifyd.conf file:
# onevent = "/path/to/file/spotify-notifications.sh" 

if [ "$PLAYER_EVENT" = "start" ] || [ "$PLAYER_EVENT" = "change" ];
then
  trackName=$(playerctl metadata title)
  artistAndAlbumName=$(playerctl metadata --format "{{ artist }} ({{ album }})")
  coverArtUrl=$(playerctl metadata mpris:artUrl)
  coverArtFile="/tmp/$(playerctl metadata mpris:artUrl | awk -F/ '{print $5}')"

  wget -P /tmp $coverArtUrl
  notify-send -u low -i "$coverArtFile" "$trackName" "$artistAndAlbumName "
  rm $coverArtFile
fi