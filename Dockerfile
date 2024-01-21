FROM adoptopenjdk:latest
ARG RELEASE_DATE=2023-09-17
ARG H2_VERSION=2.2.224
ENV H2_DATA /home/h2

RUN curl -kvL https://github.com/h2database/h2database/releases/download/version-$H2_VERSION/h2-$RELEASE_DATE.zip | jar xv

RUN useradd --user-group --system --create-home --no-log-init h2
USER h2

EXPOSE 8082 9092

CMD java -cp h2/bin/h2*.jar org.h2.tools.Server -ifNotExists \
 	-web -webAllowOthers \
 	-tcp -tcpAllowOthers \
 	-baseDir ${H2_DATA} ${H2_OPTIONS}