FROM debian:latest

# Use non-interactive mode to prevent prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update repositories and install dependencies
RUN apt update && apt install -y --no-install-recommends \
    ffmpeg curl python3 python3-venv python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Create a virtual environment for yt-dlp
RUN python3 -m venv /opt/venv \
    && /opt/venv/bin/pip install --no-cache-dir yt-dlp

# Set the default path to include the virtual environment
ENV PATH="/opt/venv/bin:$PATH"

WORKDIR /app

COPY stream.sh /app/stream.sh

RUN chmod +x /app/stream.sh

CMD ["/bin/bash", "/app/stream.sh"]
