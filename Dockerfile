FROM gradle:4.7.0-jdk8-alpine AS build
COPY parcial-arquitectura . https://github.com/SContreras-A/23-2-parcial-b/blob/871006d5df155538c8d611f8b5fbea242417be30/
WORKDIR /home/gradle/src
RUN gradle build --no-daemon

FROM openjdk:11-jre-slim

EXPOSE 8080

RUN workdir /app

COPY --from=build /home/gradle/src/build/libs/*.jar /app/spring-boot-application.jar

ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Djava.security.egd=file:/dev/./urandom","-jar","/app/spring-boot-application.jar"]