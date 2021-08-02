#
# CentOS7 with Apache2/PHP7.4
#

FROM centos:7
ENV container docker
RUN yum update -y
RUN yum install -y net-tools
RUN yum install -y bind-utils
RUN yum install -y httpd mod_ssl
RUN yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum -y install --enablerepo=remi,remi-php74 php php-mbstring php-xml php-xmlrpc php-gd php-pdo php-pecl-mcrypt php-mysqlnd php-pecl-mysql
RUN sed -i -e "s|;date.timezone =|date.timezone = Asia/Tokyo|" /etc/php.ini
RUN systemctl enable httpd
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]

