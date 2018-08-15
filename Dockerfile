FROM  openjdk:8-jdk-alpine
ARG JAR_FILENAME
COPY ./target/${JAR_FILENAME} .
ENV JAR_FILENAME=${JAR_FILENAME}
ENTRYPOINT [ "java", "-jar", "./${JAR_FILENAME}" ]
