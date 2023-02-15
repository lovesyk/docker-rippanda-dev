# build
FROM maven:3-eclipse-temurin-17 AS build
RUN git clone --depth 1 --single-branch https://github.com/lovesyk/rippanda.git \
 && mvn -f /rippanda/pom.xml package

# package
FROM eclipse-temurin:17
ENV LANG C.UTF-8

COPY --from=build /rippanda/target/rippanda-*.jar /usr/local/lib/rippanda.jar
COPY entrypoint.sh /usr/local/bin/

RUN apt-get update \
 && apt-get -y install --no-install-recommends --no-upgrade tini \
 && rm -rf /var/lib/apt/lists/* \
 && chmod +x /usr/local/bin/entrypoint.sh

VOLUME /success-dir
VOLUME /archive-dir
VOLUME /log-dir

ENTRYPOINT ["tini", "--", "entrypoint.sh"]
