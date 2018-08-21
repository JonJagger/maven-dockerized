FROM steve353/centos:7.4.1708

RUN yum -y install wget
RUN wget -nv 'https://www.dropbox.com/s/lqqp8zjc1ibmk8e/jdk-8u131-linux-x64.rpm?dl=0' -O /tmp/jdk-8u131-linux-x64.rpm
RUN wget 'https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.42.tar.gz' -O /tmp/mysql-connector-java-5.1.42.tar.gz
RUN yum -y install /tmp/jdk-8u131-linux-x64.rpm

RUN [ ! -d /app ] && mkdir -p /app/log && chmod -R 777 /app
VOLUME [ "/app/log" ]

ARG JAR_FILENAME
COPY ./target/${JAR_FILENAME} /app/my_app.jar

COPY start.sh /app/
RUN chmod 755 /app/start.sh
ENTRYPOINT [ "/app/start.sh", "/app/my_app.jar" ]
