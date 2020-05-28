FROM centos:centos7
RUN curl -o /etc/yum.repos.d/shopex-lnmp.el7.repo http://mirrors.shopex.cn/shopex/shopex-lnmp/shopex-lnmp.el7.repo
RUN yum install epel-release -y

RUN yum install ecx-job -y
RUN yum install  ecx-web -y
RUN yum clean all

RUN sed -i 's/;daemonize = yes/daemonize = no/g' "/usr/local/php72/etc/php-fpm.conf"
COPY files/supervisor.d/ /etc/supervisord.d/
COPY files/nginx/ssl.conf /usr/local/nginx/conf/
COPY files/nginx/default.conf /usr/local/nginx/conf/vhosts/default.conf

CMD ["supervisord", "-n", "-c", "/etc/supervisord.conf"] 

