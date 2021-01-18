#!/bin/bash
#show how much apt cache space is used
sudo du -sh /var/cache/apt
#clean apk cache
sudo apt-get clean
sudo apt-get autoremove

#free pagecache, dentries and inodes in cache memory
sync; echo 3 > /proc/sys/vm/drop_caches

#clear application cache
rm -rf ~/.cache/spotify/Storage/
rm -rf ~/.cache/chromium/Default/
rm -rf ~/.cache/mozilla/firefox/
rm -rf ~/.stremio-server/stremio-cache

#clear systemd journal logs
sudo journalctl --vacuum-time=3d

# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done

#show thumbnail cache size
du -sh ~/.cache/thumbnails
#remove thumbnail cache
rm -rf ~/.cache/thumbnails/*

#remove old docker files
docker system prune
