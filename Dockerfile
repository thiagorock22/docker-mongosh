FROM ubuntu:20.04

# Requirements
RUN apt update && apt install gnupg wget -y \
    && wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add - \
    && rm -rf /var/lib/apt/lists/*

# Installing mongodb shell
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list \
    && apt update && apt install -y mongodb-mongosh \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "mongosh" ]