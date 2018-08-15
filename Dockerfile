FROM  openjdk:8-jdk-alpine
ARG JAR_FILENAME
COPY ./target/${JAR_FILENAME} .
#COPY ./target/demowebmvc-0.0.1-SNAPSHOT.jar .
ENTRYPOINT [ "java", "-jar" ]

#ARG JAR_FILENAME
#COPY ./target/${JAR_FILENAME} .
#COPY ./sh/.env .
#COPY ./sh/server_up.sh .
#ENV JAR_FILENAME=${JAR_FILENAME}
#ENTRYPOINT [ "java", "-jar", "*.jar" ]
