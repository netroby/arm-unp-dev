FROM fedora:21

RUN yum clean all && \
    yum update -y && \
    yum install -y http://rpms.famillecollet.com/fedora/remi-release-21.rpm && \
    sed -i "s/enabled=0/enabled=1/g" /etc/yum.repos.d/remi.repo && \
    yum install -y http://dev.mysql.com/get/mysql-community-release-fc21-5.noarch.rpm && \
    yum update -y && \
    yum install -y php-pecl-redis supervisor nginx php-cli php-fpm php-mysqlnd php-gd php-mbstring php-mcrypt curl mysql-community-client redis && \
    yum clean all

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
