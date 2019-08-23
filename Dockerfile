FROM alpine:latest

LABEL version="1.0.0"
LABEL repository="https://github.com/loftwork/test-gtihub-action-prod"
LABEL maintainer="Makoto Omori [loftwork inc,]"

LABEL "com.github.actions.name"="FTP Deploy or FTP Local Server to Prod Server"
LABEL "com.github.actions.description"="Deploy your website via FTP"

RUN apk add lftp

COPY entrypoint.sh /entrypoint.sh
RUN chmod 777 entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
