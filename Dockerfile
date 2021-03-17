FROM openjdk:8u282-jre-slim-buster
RUN apt-get update && apt-get install -y unzip wget
RUN wget https://phoenixnap.dl.sourceforge.net/project/jogetworkflow/joget-linux-7.0.15.tar.gz && \
    tar zxvf joget-linux-7.0.15.tar.gz && \
    rm joget-linux-7.0.15.tar.gz && \
    mv joget-linux-7.0.15 /opt/joget

RUN unzip /opt/joget/apache-tomcat-8.5.58/webapps/jw.war -d /opt/joget/apache-tomcat-8.5.58/webapps/jw && \
    rm /opt/joget/apache-tomcat-8.5.58/webapps/jw.war
COPY ./Owasp.CsrfGuard.properties /opt/joget/apache-tomcat-8.5.58/webapps/WEB-INF/classes
COPY ./app_datasource-profile.template /opt/joget/data
COPY ./app_datasource.template /opt/joget/data
COPY ./run.sh /opt/joget

VOLUME /opt/joget/wflow
WORKDIR /opt/joget
EXPOSE 8080
ENTRYPOINT /opt/joget/run.sh
CMD [""]