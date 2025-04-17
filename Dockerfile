# Stage 1: Build the WAR using Maven with OpenJDK 17
FROM maven:3.8.5-openjdk-17 AS build

WORKDIR /app
COPY . /app
RUN mvn clean package -DskipTests

# Stage 2: Run the WAR using Tomcat with OpenJDK 17
FROM tomcat:10.1.18-jdk17

# Clean the default webapps folder
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Fix the default port to 8080
EXPOSE 8080

# Start Tomcat without modifying the server.xml file for dynamic port
CMD catalina.sh run
