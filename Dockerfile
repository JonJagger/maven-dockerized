FROM  openjdk:8-jdk-alpine
COPY ./target/demowebmvc-0.0.1-SNAPSHOT.jar .
ENTRYPOINT [ "java", "-jar", "./demowebmvc-0.0.1-SNAPSHOT.jar" ]
