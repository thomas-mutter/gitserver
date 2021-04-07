FROM ubuntu:20.04
RUN truncate -s0 /tmp/preseed.cfg && \
       (echo "tzdata tzdata/Areas select Europe" >> /tmp/preseed.cfg) && \
       (echo "tzdata tzdata/Zones/Europe select Zurich" >> /tmp/preseed.cfg) && \
       debconf-set-selections /tmp/preseed.cfg && \
       rm -f /etc/timezone /etc/localtime && \
       apt-get update && \
       DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true \
       apt-get install -y tzdata git apache2 apache2-utils
RUN a2enmod env cgi alias rewrite
RUN mkdir /var/www/git
RUN chown -Rfv www-data:www-data /var/www/git
COPY ./etc/git.conf /etc/apache2/sites-available/git.conf
COPY ./mk-git-repo.sh /usr/bin/mkrepo
RUN chmod +x /usr/bin/mkrepo
RUN a2dissite 000-default.conf
RUN a2ensite git.conf
RUN git config --system http.receivepack true
RUN git config --system http.uploadpack true
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
RUN /usr/bin/mkrepo test
CMD /usr/sbin/apache2ctl -D FOREGROUND
EXPOSE 80/tcp
