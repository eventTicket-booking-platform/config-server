FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /app

COPY pom.xml ./
RUN mvn -U -q -DskipTests dependency:go-offline

COPY src ./src
RUN mvn -U -q -DskipTests clean package

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

RUN addgroup -S spring && adduser -S spring -G spring
COPY --from=build /app/target/*.jar /app/app.jar

ENV SPRING_PROFILES_ACTIVE=git
USER spring

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
