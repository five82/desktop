#!/usr/bin/env bash

# moves vault files into place

# stage vault files in the desktop-vault directory before running

mv avault-spotifyd.conf roles/music/files/
mv avault-id_rsa roles/openssh/files/
mv avault-gitconfig roles/archbase/files/
