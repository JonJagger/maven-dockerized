FROM  openjdk:8-jdk-alpine
COPY /root/.m2/repository/com/olsensoft/demowebmvc/0.0.1-SNAPSHOT/demowebmvc-0.0.1-SNAPSHOT.jar .
ENTRYPOINT [ "java", "-jar", "./demowebmvc-0.0.1-SNAPSHOT.jar" ]
