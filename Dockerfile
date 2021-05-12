FROM alpine:3.10

COPY entrypoint.sh /entrypoint.sh

# Install npm & jq
RUN apk add --update npm && apk add jq

ENTRYPOINT ["/entrypoint.sh"]
