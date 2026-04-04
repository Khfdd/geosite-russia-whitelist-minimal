#!/bin/bash
cd /home/home/Projects/Go/domain-list-community
TARGET_DIR="data"
before=$(du -sh "$TARGET_DIR" | cut -f1)
./fetch_domains https://raw.githubusercontent.com/hydraponique/roscomvpn-geosite/refs/heads/master/data/category-ads
./fetch_domains https://raw.githubusercontent.com/hydraponique/roscomvpn-geosite/refs/heads/master/data/microsoft
./fetch_domains https://raw.githubusercontent.com/hydraponique/roscomvpn-geosite/refs/heads/master/data/private
./fetch_domains https://raw.githubusercontent.com/hydraponique/roscomvpn-geosite/refs/heads/master/data/roscomvpn-geosite
./fetch_domains https://raw.githubusercontent.com/hydraponique/roscomvpn-geosite/refs/heads/master/data/torrent
./fetch_domains https://raw.githubusercontent.com/hydraponique/roscomvpn-geosite/refs/heads/master/data/whitelist
./fetch_domains https://raw.githubusercontent.com/hydraponique/roscomvpn-geosite/refs/heads/master/data/win-spy
after=$(du -sh "$TARGET_DIR" | cut -f1)
./domain-list-community
echo "Before: $before | After: $after"
mv dlp.dat output/geosite.dat
git commit -am "geosite update"
git push
