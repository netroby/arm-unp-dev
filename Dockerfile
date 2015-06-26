FROM armbuild/ubuntu:vivid

RUN apt-get update -qq -y && \
    apt-get install -qq -y php5-redis supervisor nginx php5-cli php5-fpm php5-mysqlnd php5-gd php5-curl php5-mcrypt curl mysql-client redis-server redis-tools 
    

COPY etc/php-fpm.conf /etc/php-fpm.conf
COPY etc/php-fpm.d/www.conf /etc/php-fpm.d/www.conf
COPY etc/php.ini /etc/php.ini
COPY etc/supervisord.d/nginx.ini /etc/supervisord.d/nginx.ini
COPY etc/supervisord.d/php-fpm.ini /etc/supervisord.d/php-fpm.ini
COPY etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY root/.bashrc /root/.bashrc

ENV HOME /root


WORKDIR /root

CMD ["bash"]
