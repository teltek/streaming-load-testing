#!/bin/bash

# docker run -it -e "HOST_URL=https://streaming.campusdomar.es"  -e "MANIFEST_FILE=live/directo3/playlist.m3u8"    -e "mode=live"     -e "play_mode=full_playback"     -e "bitrate=highest_bitrate"     -e "LOCUST_LOCUSTFILE=/load_generator/locustfiles/vod_dash_hls_sequence.py"     -e "LOCUST_HEADLESS=true"     -e "LOCUST_USERS=10"     -e "LOCUST_SPAWN_RATE=1"     -e "LOCUST_RUN_TIME=120s"     -e "LOCUST_ONLY_SUMMARY=true"     -e "buffer_size=8"     -p 8089:8089     unifiedstreaming/load-generator:latest     --no-web

HOST_URL=https://streaming.campusdomar.es \
MANIFEST_FILE=live/test/playlist.m3u8 \
mode=live \
play_mode=full_playback \
bitrate=highest_bitrate \
buffer_size=2 \
LOCUST_RUN_TIME=120s \
locust -f load_generator/locustfiles/vod_dash_hls_sequence.py  --no-web -c 1 -r 1 --run-time 60s --only-summary  --csv=test-results/output_example
