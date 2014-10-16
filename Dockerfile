FROM ubuntu:latest

# apache setting
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_SERVERNAME localhost

RUN apt-get update

RUN apt-get install -y apache2
RUN apt-get install -y mysql-server
RUN apt-get install -y php5
RUN apt-get install -y wget
RUN apt-get install -y phpmyadmin
RUN apt-get install -y postfix
RUN apt-get install -y vim
RUN apt-get install -y supervisor
RUN apt-get install -y postgresql
RUN apt-get install -y phppgadmin


# eccube
RUN rm /var/www/html/index.html
ADD download.sh /var/www/html/download.sh

# WORKDIR /var/www/html

RUN cd /var/www/html && bash download.sh

RUN cd /var/www/html/ && find *gz -exec tar xfv {} \;

ADD mysql-utf8.cnf /etc/mysql/conf.d/mysql-utf8.cnf


# apache setting
ADD 050-phpmyadmin.conf /etc/apache2/sites-enabled/050-phpmyadmin.conf

# phpmyadmin setting
ADD config.inc.php /etc/phpmyadmin/config.inc.php

add README.html /var/www/html/README.html

# postgres setting
ADD 051-phppgadmin.conf /etc/apache2/sites-enabled/051-phppgadmin.conf


# postgres password setting to login phppgadmin
RUN service postgresql start && \
su - postgres -c "psql -U postgres -d postgres -c \"alter user postgres with password 'postgres';\""


# php5.5 does not work pear's Tar.php so overwrite it.
RUN wget http://download.pear.php.net/package/Archive_Tar-1.3.11.tgz
RUN tar xf Archive_Tar-1.3.11.tgz
RUN find /var/www/html/ | grep Archive/Tar.php | grep 2.12 |xargs -L 1 cp Archive_Tar-1.3.11/Archive/Tar.php


ADD phppgadmin.config.inc.php /etc/phppgadmin/config.inc.php


# supervisor config
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisord.conf


EXPOSE 80 3306 5432

# Define default command.
CMD ["supervisord", "-n"]

