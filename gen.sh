#!/bin/bash
cd /home/home/Projects/Go/domain-list-community
TARGET_DIR="data"
before=$(du -sh "$TARGET_DIR" | cut -f1)
./fetch_domains https://raw.githubusercontent.com/hydraponique/roscomvpn-geosite/refs/heads/master/data/apple
./fetch_domains
./fetch_domains
./fetch_domains
./fetch_domains
./fetch_domains
after=$(du -sh "$TARGET_DIR" | cut -f1)
echo "Before: $before | After: $after"
