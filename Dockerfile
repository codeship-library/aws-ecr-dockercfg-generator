FROM debian:jessie

# install deps
RUN apt-get update && apt-get install -y apt-transport-https python python-pip unzip

# install docker
RUN echo 'deb https://apt.dockerproject.org/repo debian-jessie main' > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y --force-yes docker-engine

ENV PATH /root/.local/lib/aws/bin/:$PATH

RUN mkdir -p ~/.aws

RUN pip install awscli

ADD aws_docker_creds.sh . 

ENTRYPOINT ["./aws_docker_creds.sh"]
