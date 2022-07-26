FROM ubuntu
LABEL "Environment" = "Production"
RUN apt-get update -y && apt-get install tar -y && apt-get install gzip -y && apt-get install apache2 -y
WORKDIR ./thala
# ADD raj.tar.gz .
ADD https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war /
# COPY raj.tar.gz /root/raji.txt
COPY index.html /var/www/html
ENV mynameis raj
ARG hey paaru
EXPOSE 80
ENTRYPOINT ["apachectl","-D","FOREGROUND"]

#somechange
