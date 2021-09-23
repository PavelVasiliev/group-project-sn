FROM adoptopenjdk/openjdk11:alpine-jre
MAINTAINER Group15 <soc.net.group15@gmail.com>

ARG JAR_FILE=target/discovery-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} discovery.jar
ENV JAVA_OPTS=""
EXPOSE 8888
ENTRYPOINT ["java","-jar","/discovery.jar"]