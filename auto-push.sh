#!/bin/bash
cd /root/VividEnhancements

echo "Auto-push started. Watching for changes..."

while true; do
    if git status --porcelain | grep -q .; then
        echo "Changes detected, pushing..."
        git add .
        git commit -m "Auto-update: $(date '+%Y-%m-%d %H:%M:%S')"
        git push origin master
        echo "Pushed at $(date)"
    fi
    sleep 5
done