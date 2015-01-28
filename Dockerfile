FROM fedora:21
RUN yum clean all
RUN yum update -y
RUN yum install -y http://dev.mysql.com/get/mysql-community-release-fc21-5.noarch.rpm 
RUN yum update -y
RUN yum install -y nginx php-cli php-fpm php-mysqlnd php-gd php-mbstring php-mcrypt curl
RUN yum clean all


