FROM eclipse-temurin:26-jdk-jammy

WORKDIR /app

USER root
RUN apt-get update && apt-get install -y python3

COPY bin/ta-utils /app/bin/ta-utils
RUN chmod +x /app/bin/ta-utils

RUN useradd -m runner
USER runner

CMD ["./bin/ta-utils",  "run"]
