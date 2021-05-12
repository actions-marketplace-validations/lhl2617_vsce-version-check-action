FROM mhart/alpine-node:14

COPY entrypoint.sh /entrypoint.sh

# Install jq
RUN apk add jq

ENTRYPOINT ["/entrypoint.sh"]
