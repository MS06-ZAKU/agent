#
# CentOS7 with Apache2/PHP7.4
#
# 2021/8/2 R2
#

FROM centos:7
ENV container docker
RUN yum update -y
RUN yum install -y net-tools
RUN yum install -y bind-utils
RUn yum install -y unzip
RUn yum install -y which
RUN yum install -y httpd mod_ssl
RUN yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum -y install --enablerepo=remi,remi-php74 php php-mbstring php-xml php-xmlrpc php-gd php-pdo php-pecl-mcrypt php-mysqlnd php-pecl-mysql
RUN sed -i -e "s|;date.timezone =|date.timezone = Asia/Tokyo|" /etc/php.ini
RUN systemctl enable httpd
#
# If update Appdynamics agent 
# Upload to jennkins workspace /tmp 
# Change below text "appdynamics-php-agent.x86_64-21.7.0.4560.zip"
#
COPY appdynamics-php-agent.zip /tmp/
WORKDIR /tmp
RUN unzip /tmp/appdynamics-php-agent.zip
RUN chmod +x /tmp/appdynamics-php-agent-linux_x64/runme.sh
RUN /tmp/appdynamics-php-agent-linux_x64/runme.sh
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]

