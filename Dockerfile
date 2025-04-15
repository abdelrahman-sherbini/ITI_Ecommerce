# Use official Tomcat base image with Java
FROM tomcat:9.0-jdk11

# Remove default web apps to avoid conflicts
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR file into Tomcat’s webapps as ROOT.war
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat default port
EXPOSE 8080

# Tomcat runs automatically, no CMD needed
