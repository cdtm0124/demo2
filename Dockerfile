FROM tomcat:latest
ADD target/demo.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 9090
CMD ["catalina.sh", "run"]
