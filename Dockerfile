# Build stage
FROM eclipse-temurin:17-jdk AS build
WORKDIR /workspace
COPY ./app /workspace
RUN mvn -f /workspace/pom.xml -B -DskipTests package

# Run stage
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /workspace/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
