FROM  openjdk:8-jdk-alpine
ARG JAR_FILENAME
COPY ./target/${JAR_FILENAME} .
# You can't pass "${JAR_FILENAME}" as a third argument here
# because entrypoint does not support globbing.
# Instead JAR_FILENAME is added as a CMD arg in
# container_up.sh
ENTRYPOINT [ "java", "-jar" ]
