FROM eclipse-temurin:17-jdk-jammy


WORKDIR /openmrs

RUN apt-get update && apt-get install -y wget unzip && \
    wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.82/bin/apache-tomcat-9.0.82.tar.gz && \
    tar -xvf apache-tomcat-9.0.82.tar.gz && \
    mv apache-tomcat-9.0.82 tomcat && \
    rm apache-tomcat-9.0.82.tar.gz

RUN wget --no-check-certificate https://sourceforge.net/projects/openmrs/files/releases/OpenMRS_2.6.0/openmrs.war/download -O openmrs.war



RUN mv openmrs.war tomcat/webapps/

RUN mkdir -p /root/.OpenMRS

EXPOSE 8080

CMD ["tomcat/bin/catalina.sh", "run"]
