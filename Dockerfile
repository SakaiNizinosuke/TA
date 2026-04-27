FROM eclipse-temurin:26-jdk-jammy

WORKDIR /app

USER root
RUN apt-get update && apt-get install -y \
    python3 \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libxtst6 \
    libxi6 \
    libxrandr2 \
    libxfixes3 \
    libxcursor1 \
    x11-apps \
    && rm -rf /var/lib/apt/lists/*

COPY bin/ta-utils /app/bin/ta-utils
RUN chmod +x /app/bin/ta-utils

RUN useradd -m runner
USER runner

CMD ["./bin/ta-utils",  "run"]
