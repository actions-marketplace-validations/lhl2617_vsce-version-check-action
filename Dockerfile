FROM mhart/alpine-node:12

COPY entrypoint.sh /entrypoint.sh

# Install jq
RUN apk add jq

ENTRYPOINT ["/entrypoint.sh"]
