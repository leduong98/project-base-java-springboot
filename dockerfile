FROM maven:3.8.6-jdk-8 AS build

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

FROM openjdk:8-jdk-alpine

WORKDIR /app

COPY --from=build app/target/coffe-be-0.0.1-SNAPSHOT.war app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
