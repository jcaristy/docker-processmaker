FROM simplific/nginx-php



ENV PROCESSMAKER_VERSION 3.0.1.8



COPY "processmaker-${PROCESSMAKER_VERSION}.tar.gz" /temp/processmaker.tar.gz
ADD files/01-processmaker.conf /etc/nginx/conf.d/01-processmaker.conf



RUN 	apk --no-cache --update add php-ctype php-cli php-curl php-soap php-ldap php-dom php-mysql freetds php-mssql \
		&& echo "*/5 * * * * php -f /opt/processmaker/workflow/engine/bin/cron.php +force" >> /var/spool/cron/crontabs/root



#RUN mkdir -p /opt/processmaker/
WORKDIR "/opt/processmaker/"
VOLUME "/opt/processmaker/"



COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]
CMD ["/run.sh"]
