ARG SBT_VERSION
FROM openjdk:8-jre-alpine

ENV SCALA_HOME=/usr/share/scala
ENV SBT_VERSION ${SBT_VERSION:-1.2.6}

# Install sbt
RUN apk add --no-cache --virtual=.build-dependencies wget ca-certificates && \
    apk add --no-cache bash && \
    cd "/tmp" && \
    wget "https://piccolo.link/sbt-${SBT_VERSION}.tgz" && \
    tar xzf "sbt-${SBT_VERSION}.tgz" && \
    mkdir "${SCALA_HOME}" && \
    rm "/tmp/sbt/bin/"*.bat && \
    mv "/tmp/sbt/bin" "/tmp/sbt/lib" "${SCALA_HOME}" && \
    ln -s "${SCALA_HOME}/bin/"* "/usr/bin/" && \
    apk del .build-dependencies && \
    rm -rf "/tmp/"*
