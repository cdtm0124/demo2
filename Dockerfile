FROM tomcat:latest
ADD target/demo.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8081
CMD ["catalina.sh", "run"]
