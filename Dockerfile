# build
FROM maven:3-eclipse-temurin-21 AS build
RUN git clone --depth 1 --single-branch https://github.com/lovesyk/rippanda.git \
 && mvn -f /rippanda/pom.xml package

# package
FROM eclipse-temurin:21
ENV LANG C.UTF-8

COPY --from=build /rippanda/target/rippanda-*.jar /usr/local/lib/rippanda.jar

VOLUME /success-dir
VOLUME /archive-dir

ENTRYPOINT ["/opt/java/openjdk/bin/java", "-jar", "/usr/local/lib/rippanda.jar"]
