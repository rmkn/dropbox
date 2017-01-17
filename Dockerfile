FROM centos:6
MAINTAINER rmkn
RUN localedef -f UTF-8 -i ja_JP ja_JP.utf8 && sed -i -e "s/en_US.UTF-8/ja_JP.UTF-8/" /etc/sysconfig/i18n
RUN cp -p /usr/share/zoneinfo/Japan /etc/localtime && echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock
RUN yum -y update

ENV LANG ja_JP.UTF-8

WORKDIR /root
RUN curl -o dropbox.tar.gz -SL "https://www.dropbox.com/download?plat=lnx.x86_64"
RUN tar zxf dropbox.tar.gz
RUN curl -o dropbox.py -SL "http://www.dropbox.com/download?dl=packages/dropbox.py"
RUN chmod a+x dropbox.py

CMD ["/root/.dropbox-dist/dropboxd"]
