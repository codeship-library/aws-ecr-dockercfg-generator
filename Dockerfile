FROM gliderlabs/alpine:3.3

RUN apk --no-cache add bash docker python py-pip \
    && mkdir ~/.aws \
    && pip install --upgrade pip \
    && pip install awscli

ADD aws_docker_creds.sh /

ENTRYPOINT ["/aws_docker_creds.sh"]
