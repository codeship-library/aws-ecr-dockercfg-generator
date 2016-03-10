FROM gliderlabs/alpine:3.3

RUN apk --no-cache add bash docker jq

# purposely split this up so layers can download in parallel
RUN apk --no-cache add python py-pip \
    && mkdir ~/.aws \
    && pip install --upgrade pip \
    && pip install awscli

ADD aws_docker_creds.sh /

ENTRYPOINT ["/aws_docker_creds.sh"]
