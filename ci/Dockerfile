FROM golang:1.9

RUN apt-get update && apt-get install -y upx-ucl

RUN go get github.com/pwaller/goupx

VOLUME /src
WORKDIR /src

COPY build_environment.sh /
COPY build.sh /

RUN chmod +x /build_environment.sh /build.sh

ENTRYPOINT ["/build.sh"]
