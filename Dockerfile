FROM debian:latest

# Use non-interactive mode to prevent prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update repositories and install dependencies
RUN apt update && apt install -y --no-install-recommends ffmpeg curl python3 python3-pip \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install yt-dlp  

WORKDIR /app

COPY stream.sh /app/stream.sh

RUN chmod +x /app/stream.sh

CMD ["/bin/bash", "/app/stream.sh"]
