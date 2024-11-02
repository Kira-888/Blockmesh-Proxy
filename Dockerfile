FROM ubuntu:22.04


RUN apt update && \
    apt install -y wget tar uuid-runtime proxychains4 && \
    rm -rf /var/lib/apt/lists/*


WORKDIR /app


COPY target/x86_64-unknown-linux-gnu/release/blockmesh-cli ./blockmesh-cli
COPY script.sh ./script.sh


RUN chmod +x blockmesh-cli script.sh


CMD ["bash", "script.sh"]
