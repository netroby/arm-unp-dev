FROM fedora:21

VOLUME /var/log

RUN yum clean all && \
    yum update -y && \
    yum install -y http://rpms.famillecollet.com/fedora/remi-release-21.rpm && \
    sed -i "s/enabled=0/enabled=1/g" /etc/yum.repos.d/remi.repo && \
    yum install -y http://dev.mysql.com/get/mysql-community-release-fc21-5.noarch.rpm && \
    yum update -y && \
    yum install -y vim nginx php-cli php-fpm php-mysqlnd php-gd php-mbstring php-mcrypt curl && \
    yum clean all && \

ENV HOME /root


WORKDIR /root

CMD ["bash"]
