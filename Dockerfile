FROM debian:latest

# Install dependencies
RUN apt update && apt install -y ffmpeg curl python3 python3-pip && pip3 install yt-dlp  

WORKDIR /app

COPY stream.sh /app/stream.sh

RUN chmod +x /app/stream.sh

CMD ["/bin/bash", "/app/stream.sh"]
