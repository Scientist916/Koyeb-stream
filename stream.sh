#!/bin/bash
while true; do
  ffmpeg -re -i "$(yt-dlp -g --retry 5 "https://www.youtube.com/live/tNkZsRW7h2c")" \
    -c:v copy -c:a aac -b:a 128k -f flv "rtmps://dc1-1.rtmp.t.me/s/2276514912:NiQniN6jcB-gUvqiW5NhsQ"
  sleep 5
done
