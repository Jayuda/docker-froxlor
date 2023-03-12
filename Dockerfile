FROM debian:latest

USER root

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apache2
RUN apt-get install -y libapache2-mod-php7.0
RUN apt-get install -y php-xml
RUN apt-get install -y php-mbstring
RUN apt-get install -y php-curl
RUN apt-get install -y php-zip
RUN apt-get install -y php-bcmath
RUN apt-get install -y php-mysql
RUN apt-get install -y mysql-client

COPY froxlor /var/www/html/froxlor

RUN chown www-data:www-data /var/www/html/froxlor -R
RUN sed -i 's/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/html\/froxlor/' /etc/apache2/sites-available/000-default.conf

CMD /usr/sbin/apache2ctl -D FOREGROUND
