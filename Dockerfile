FROM fedora:22

RUN dnf clean all && \
    dnf update -y && \
    dnf install -y http://rpms.famillecollet.com/fedora/remi-release-22.rpm && \
    sed -i "s/enabled=0/enabled=1/g" /etc/yum.repos.d/remi.repo && \
    dnf install -y http://dev.mysql.com/get/mysql-community-release-fc22-5.noarch.rpm && \
    dnf update -y && \
    dnf install -y php-pecl-redis supervisor nginx php-cli php-fpm php-mysqlnd php-gd php-mbstring php-mcrypt curl mysql-community-client redis && \
    dnf clean all

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
