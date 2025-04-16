# Stage 1: Build the WAR using Maven with OpenJDK 21
FROM 3.8.5-openjdk-17 AS build

# Set the working directory
WORKDIR /app

# Copy the whole project
COPY . /app

# Build the WAR file without running tests (you can remove -DskipTests if needed)
RUN mvn clean package -DskipTests

# Stage 2: Run the WAR using Tomcat with OpenJDK 21
FROM tomcat:10.1.18-jdk17

# Clean the default webapps folder to prevent Tomcat from serving anything else
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR file from the build stage into Tomcat's webapps folder
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose the port that Tomcat will be listening on (default is 8080)
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]

