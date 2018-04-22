FROM openjdk:8
ADD target/docker-sb.jar docker-sb.jar
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "docker-sb.jar"]