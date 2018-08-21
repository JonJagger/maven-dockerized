FROM  openjdk:8-jdk-alpine

RUN [ ! -d /app ] && mkdir -p /app/log && chmod -R 777 /app
VOLUME [ "/app/log" ]

ARG JAR_FILENAME
COPY ./target/${JAR_FILENAME} /app/my_app.jar
# You can't pass "${JAR_FILENAME}" as a third argument here
# because entrypoint does not support globbing.
# Instead JAR_FILENAME is added as a CMD arg in
# container_up.sh
ENTRYPOINT [ "java", "-jar", "/app/my_app.jar" ]
