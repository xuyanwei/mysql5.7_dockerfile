FROM centos:6.6
MAINTAINER Victor root@100pp.com
USER root
#RUN rm -f /etc/yum.repos.d/*
RUN mkdir -p /mysql
WORKDIR /mysql
ADD ./mysql/* /mysql/
RUN yum update -y && yum upgrade -y
#RUN yum install -y numactl
RUN yum install perl -y
RUN yum install wget -y
RUN yum install numactl -y
RUN yum install net-tools -y 
RUN wget http://mirror.centos.org/centos/6/os/x86_64/Packages/libaio-0.3.107-10.el6.x86_64.rpm
RUN rpm -ivh libaio-0.3.107-10.el6.x86_64.rpm
RUN yum install glibc.i686 -y
RUN yum list libstdc++* -y
#RUN yum install gcc* -y 
RUN rpm -ivh mysql-community-common-5.7.20-1.el6.x86_64.rpm
RUN rpm -ivh mysql-community-libs-5.7.20-1.el6.x86_64.rpm
RUN rpm -ivh mysql-community-client-5.7.20-1.el6.x86_64.rpm 
RUN rpm -ivh mysql-community-server-5.7.20-1.el6.x86_64.rpm 

ADD init/mysql_init.sh /opt
RUN chmod 775 /opt/mysql_init.sh

RUN yum install python -y
RUN yum -y install epel-release
RUN yum install python-pip -y
RUN pip install --upgrade pip
RUN yum install initscripts -y
#RUN yum install mysql-server -y
RUN yum install redis -y
RUN yum install rsync -y
RUN yum install mongodb -y
RUN yum install ftp -y
CMD cd /opt/
EXPOSE 80 3306 6379 27017 22 21
ENTRYPOINT service mysqld start && /opt/mysql_init.sh && /bin/bash
#ENTRYPOINT /bin/bash
