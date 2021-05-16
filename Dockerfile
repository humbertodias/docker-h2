FROM adoptopenjdk:latest
ARG RELEASE_DATE=2019-03-13
ENV H2_DATA /opt/h2-data

RUN curl -s http://www.h2database.com/h2-$RELEASE_DATE.zip | jar xv

RUN mkdir -p ${H2_DATA}
EXPOSE 8082 9092

VOLUME /h2-data

CMD java -cp h2/bin/h2*.jar org.h2.tools.Server -ifNotExists \
 	-web -webAllowOthers \
 	-tcp -tcpAllowOthers \
 	-baseDir ${H2_DATA} ${H2_OPTIONS}