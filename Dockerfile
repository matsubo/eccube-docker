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



# eccube
RUN rm /var/www/html/index.html
ADD download.sh /var/www/html/download.sh

# WORKDIR /var/www/html

RUN cd /var/www/html && bash download.sh

RUN cd /var/www/html/ && find *gz -exec tar xfv {} \;

ADD mysql-utf8.cnf /etc/mysql/conf.d/mysql-utf8.cnf

# supervisor config
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisord.conf

# apache setting
ADD 050-phpmyadmin.conf /etc/apache2/sites-enabled/050-phpmyadmin.conf

# phpmyadmin setting
ADD config.inc.php /etc/phpmyadmin/config.inc.php

add README.html /var/www/html/README.html

EXPOSE 80 3306

# Define default command.
CMD ["supervisord", "-n"]

