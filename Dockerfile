# Use official Tomcat base image
FROM tomcat:10.1-jdk21-temurin

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file into Tomcat's webapps directory
COPY target/soccerapp.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080