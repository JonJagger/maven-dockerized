FROM steve353/centos:7.4.1708
LABEL maintainer=jon@jaggersoft.com

ENV ELK=172.31.0.72
EXPOSE 7036

RUN [ ! -d /app ] && mkdir -p /app/log && chmod -R 777 /app

RUN yum -y install wget

# Install Java
RUN wget -nv 'https://www.dropbox.com/s/lqqp8zjc1ibmk8e/jdk-8u131-linux-x64.rpm?dl=0' -O /tmp/jdk-8u131-linux-x64.rpm
RUN wget 'https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.42.tar.gz' -O /tmp/mysql-connector-java-5.1.42.tar.gz
RUN yum -y install /tmp/jdk-8u131-linux-x64.rpm

# Install logstash
RUN wget -q https://artifacts.elastic.co/downloads/logstash/logstash-6.2.4.tar.gz -O /tmp/logstash.tgz
RUN cd /app && tar xf /tmp/logstash.tgz
RUN mkdir /app/logstash-6.2.4/conf
COPY logstash/conf/* /app/logstash-6.2.4/conf/

# - - - - - - - - - - - - - - - - - - - - - - - - -

COPY start.sh /app/
RUN chmod 755 /app/start.sh
ARG JAR_FILENAME
COPY ./target/${JAR_FILENAME} /app/my_app.jar
ENTRYPOINT [ "/app/start.sh", "/app/my_app.jar" ]
