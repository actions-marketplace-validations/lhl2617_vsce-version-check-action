FROM mhart/alpine-node:14

COPY entrypoint.sh /entrypoint.sh

# Install jq and dpkg
RUN apk add jq && apk add dpkg

ENTRYPOINT ["/entrypoint.sh"]
