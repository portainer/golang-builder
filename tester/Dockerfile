FROM golang:latest

VOLUME /src
WORKDIR /src

COPY build_environment.sh /
COPY test.sh /

ENTRYPOINT ["/test.sh"]
