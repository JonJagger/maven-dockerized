FROM  openjdk:8-jdk-alpine

RUN [ ! -d /app ] && mkdir -p /app/log && chmod -R 777 /app
VOLUME [ "/app/log" ]

ARG JAR_FILENAME
COPY ./target/${JAR_FILENAME} /app/my_app.jar

COPY start.sh /app/
RUN chmod 755 /app/start.sh
ENTRYPOINT [ "/app/start.sh" ]

#ENTRYPOINT [ "java", "-jar", "/app/my_app.jar" ]
