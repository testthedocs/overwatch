FROM ruby:2.6.3-alpine

LABEL maintainer="Sven <sven@okular-d.org>" \
    description="Ruby2.6 - Cucumber - Alpine " \
    org.label-schema.vendor="okular-d"

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN mkdir /cucumber \
    && apk add --no-cache --virtual .build-deps \
        build-base \
    && chmod +x /usr/local/bin/entrypoint.sh

RUN adduser -s /bin/false -D -H okld \
    && apk add --no-cache \
        bash \
        libc6-compat \
        tini \
        su-exec

WORKDIR /usr/local/bin
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN wget https://github.com/errata-ai/vale/releases/download/v1.4.0/vale_1.4.0_Linux_64-bit.tar.gz -O - | tar -xz

WORKDIR /cucumber
COPY Gemfile .

RUN gem install bundler --source http://rubygems.org &&\
    bundle install && \
    apk del .build-deps

ENTRYPOINT [ "/sbin/tini", "--", "/usr/local/bin/entrypoint.sh" ]

