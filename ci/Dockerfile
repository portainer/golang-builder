FROM golang:1.9

RUN apt-get update && apt-get install -y upx-ucl apt-transport-https

RUN go get github.com/pwaller/goupx && \
    go get github.com/govend/govend

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb https://dl.yarnpkg.com/debian/ stable main' | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y nodejs

VOLUME /src
WORKDIR /src

COPY build_environment.sh /
COPY build.sh /

RUN chmod +x /build_environment.sh /build.sh

ENTRYPOINT ["/build.sh"]
