FROM php:apache

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y wget

# eccube
ADD download.sh /var/www/html/download.sh

RUN bash download.sh
RUN rm download.sh


RUN  find *gz -exec tar xfv {} \;

add README.html /var/www/html/README.html
add .htaccess /var/www/html/.htaccess


RUN { \
  echo '<FilesMatch \.php$>'; \
    echo '\tSetHandler application/x-httpd-php'; \
    echo '</FilesMatch>'; \
    echo; \
    echo 'DirectoryIndex disabled'; \
    echo 'DirectoryIndex index.php index.html'; \
    echo; \
    echo '<Directory /var/www/>'; \
    echo '\tOptions +Indexes'; \
    echo '</Directory>'; \
} | tee "$APACHE_CONFDIR/conf-available/docker-php.conf"


RUN apt-get install -y apache2-dev

RUN apt-get install -y libpq-dev
RUN pecl install pdo_pgsql

RUN apt-get install -y libmysqlclient-dev
RUN pecl install pdo_mysql




