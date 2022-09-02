FROM --platform=$BUILDPLATFORM php:7.3-apache

ARG TARGETARCH
ARG DISTRO=linux-generic
ARG PRINCE_VER=14.3

ARG prince_file=prince-${PRINCE_VER}-${DISTRO}

RUN apt-get update && apt-get install --no-install-recommends -y \
    fonts-ipafont-mincho \
    fonts-arphic-uming \
    fonts-opensymbol \
    fonts-liberation2 \
    libfontconfig \
    && prince_arch=$([ "$TARGETARCH" == "arm64" ] && echo "aarch64-musl" || echo "x86_64") \
    && curl https://www.princexml.com/download/${prince_file}-${prince_arch}.tar.gz -O \
    && tar zxf ${prince_file}-${prince_arch}.tar.gz \
    && cd ${prince_file}-${prince_arch} \
    && yes "" | ./install.sh

ENTRYPOINT ["prince"]
