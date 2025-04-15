# Stage 1: Build the WAR using Maven
FROM maven:3.8.5-openjdk-11 AS build

WORKDIR /app
COPY . /app

RUN mvn clean package -DskipTests

# Stage 2: Run the WAR using Tomcat
FROM tomcat:9.0-jdk11

# Clean default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy built WAR file from stage 1
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
