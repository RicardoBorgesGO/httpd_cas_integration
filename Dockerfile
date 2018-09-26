FROM debian

MAINTAINER Ricardo Borges <ricardoborges@ufg.br>

RUN apt-get update && apt-get upgrade;\
    apt-get -y install apache2; \
    apt-get -y install libapache2-mod-auth-cas

ADD assets/apache2.conf /etc/apache2/
ADD assets/ports.conf /etc/apache2/
ADD sites-available/* /etc/apache2/sites-available/
ADD assets/_.ufg.br /home/certs/

RUN mv /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf.bk; \
    cd /etc/apache2/sites-available/; \
    a2ensite *.conf

#docker build -t httpd_ufg .