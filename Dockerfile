FROM tomcat:9.0.118-jdk8-corretto-al2
WORKDIR /java
COPY pom.xml .
RUN yum install -y maven && mvn clean install
COPY . .
EXPOSE 8080
RUN cp target/*.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]

