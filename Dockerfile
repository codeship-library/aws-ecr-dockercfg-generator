FROM alpine:3.4
MAINTAINER maintainers@codeship.com

ENV \
  AWS_CLI_VERSION="1.10.64" \
  PIP_DISABLE_PIP_VERSION_CHECK=true

# purposely split this up so layers can download in parallel
RUN \
  apk --no-cache add \
    bash \
    docker \
    jq

RUN \
  apk --no-cache add \
    py-pip \
    python && \
  pip install awscli==${AWS_CLI_VERSION} && \
  mkdir -p "${HOME}/.aws"

COPY aws_docker_creds.sh /

ENTRYPOINT ["/aws_docker_creds.sh"]
