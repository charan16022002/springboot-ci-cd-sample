# Multi-stage Dockerfile
# Stage 1: build the application using an image that has Maven + JDK
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /workspace

# Copy only the app folder (keep context small)
COPY app ./app

# Build the jar (skip tests here because CI already ran them)
RUN mvn -f app/pom.xml -B -DskipTests package

# Stage 2: runtime image (smaller)
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy the built jar from the build stage
COPY --from=build /workspace/app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
