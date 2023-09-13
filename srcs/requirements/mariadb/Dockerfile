FROM debian:bullseye

RUN apt update && apt install mariadb-server -y

COPY conf /etc/mysql/

COPY scripts/setup_and_run /

ENTRYPOINT ["/bin/bash", "/setup_and_run"]
