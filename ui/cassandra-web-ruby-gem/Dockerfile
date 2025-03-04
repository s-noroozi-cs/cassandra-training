FROM ruby:2.6.2-alpine

ENV VERSION 0.5.0

RUN apk add --no-cache --update --virtual=build-dependencies build-base linux-headers gcc g++ \
    && gem install cassandra-web -v ${VERSION} \
    && apk del build-dependencies \
    && apk add --no-cache --update bash \
    && rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

COPY run.sh /
RUN chmod +x /run.sh

CMD ["/run.sh"]