FROM adoptopenjdk/openjdk11:alpine-jre
MAINTAINER Group15 <soc.net.group15@gmail.com>

ARG JAR_FILE=target/gateway-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} gateway.jar
ENV JAVA_OPTS=""
EXPOSE 8086
ENTRYPOINT ["java","-jar","/gateway.jar"]