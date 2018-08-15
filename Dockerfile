FROM  openjdk:8-jdk-alpine
COPY ./target/demowebmvc-0.0.1-SNAPSHOT.jar .
ENTRYPOINT [ "java", "-jar", "./demowebmvc-0.0.1-SNAPSHOT.jar" ]

#ARG JAR_FILENAME
#COPY ./target/${JAR_FILENAME} .
#COPY ./sh/.env .
#COPY ./sh/server_up.sh .
#ENV JAR_FILENAME=${JAR_FILENAME}
#ENTRYPOINT [ "java", "-jar", "*.jar" ]
