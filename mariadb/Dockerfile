FROM debian:bullseye

RUN apt update && apt install mariadb-server -y

COPY conf /etc/mysql/

COPY scripts/setup_and_run /

# RUN export `cat .env` \
# 	service mariadb start && \
# 	mariadb < db_setup.sql && \
# 	rm db_setup.sql && \ 
# 	service mariadb stop

ENTRYPOINT ["/bin/bash", "/setup_and_run"]
