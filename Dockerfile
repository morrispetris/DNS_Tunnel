FROM alpine:edge
MAINTAINER Hong Hao <oahong@gmail.com>

WORKDIR /dnstunnel

ADD * ./

RUN sed -e 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' -i /etc/apk/repositories

# I'm not going to learn ash syntax
#RUN apk update && apk upgrade libssl1.0 && apk add bash python3 ca-certificates && update-ca-certificates
RUN apk update && apk upgrade libressl-dev && apk add bash python3 py3-pip ca-certificates && update-ca-certificates

RUN pip3 install -r requirements.txt

EXPOSE 5353/udp 5353/tcp

ENTRYPOINT ["./docker-start.sh"]


