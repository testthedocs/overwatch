FROM alpine:3.9
LABEL maintainer "Sven <sven@testthedocs.org" \
        org.label-schema.vendor = "TestTheDocs" \
        boilr_version=$BOILR_VERSION

ENV BOILR_VERSION 0.4.5

RUN apk add --no-cache --virtual build-deps \
        wget \
	tar \
	&& adduser -s /bin/false -D -h /home/okld okld \
        && apk --no-cache add \
        tini \
        su-exec \
        libc6-compat \
        bash \
        ca-certificates \
	&& wget -O - https://github.com/Ilyes512/boilr/releases/download/${BOILR_VERSION}/boilr_${BOILR_VERSION}_Linux_64-bit.tar.gz | tar xvfz - -C /usr/local/bin/ \
        && rm /usr/local/bin/LICENSE \
        && rm /usr/local/bin/README.md \
	&& apk del --purge build-deps

USER okld
WORKDIR /home/okld

RUN boilr template download aluriak/boilr-python python

#VOLUME /src
WORKDIR /src

#COPY dockerfiles/entrypoint.sh /usr/local/bin/entrypoint.sh

#EXPOSE 1313
ENTRYPOINT [ "/bin/bash" ]
#ENTRYPOINT [ "/sbin/tini", "--", "/usr/local/bin/entrypoint.sh" ]

