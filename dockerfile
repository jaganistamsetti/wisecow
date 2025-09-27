FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        fortune-mod \
        fortunes \
        cowsay \
        netcat \
        bash \
        curl \
    && rm -rf /var/lib/apt/lists/*

# Add /usr/games to PATH (fortune and cowsay live here)
ENV PATH="/usr/games:${PATH}"

WORKDIR /app

# Copy your script
COPY wisecow.sh .

RUN chmod +x wisecow.sh

EXPOSE 4499

CMD ["./wisecow.sh"]


