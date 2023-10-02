FROM adoptopenjdk:17-jre-hotspot
COPY target/helloworld-0.0.1-SNAPSHOT.jar /app/helloworld-0.0.1-SNAPSHOT.jar
EXPOSE 8081
CMD ["java", "-jar", "/app/helloworld-0.0.1-SNAPSHOT.jar"]
