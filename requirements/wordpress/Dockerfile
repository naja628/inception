FROM debian:bullseye

# change php version depending on base image
RUN apt update && apt install php7.4-dev php7.4-fpm php7.4-mysql -y
RUN apt install mariadb-client -y

# only needed for build so DF could be improved by using 2 stages
RUN apt install wget curl -y 

# download latest version of wordpress (as tar + extract)
WORKDIR /var/www/website
RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xvzf latest.tar.gz && \
	rm latest.tar.gz && \
	mv wordpress/* . && \
	rmdir wordpress

COPY conf/wp-config.php .


# download wp-cli tool
RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/bin/wp && \
	chmod +x /usr/bin/wp

# php conf that listens on TCP socket
RUN rm -rf /etc/php/7.4/fpm/
COPY conf/php /etc/php/7.4/fpm

# for some reason this doesn't get created automatically 
#+and it causes problems
RUN mkdir /run/php

COPY scripts/ /
ENTRYPOINT ["/bin/bash", "/setenv_runfpm"]
