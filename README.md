# Dockercfg Generation Service for AWS ECR

This container allows you to generate a temporary dockercfg using your AWS credentials
and writes it to a specified filename. Typical usage of this image would be to run it 
with a volume attached, and write the dockercfg to that volume.

In order to export a dockercfg, the container needs access to a docker instance, so
you must mount a docker socket, or provide access to a docker host in some way.
 
```
$ cat aws_creds.env
AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXXXX
AWS_SECRET_ACCESS_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
AWS_REGION=us-east-1
$ docker run -it -v ./data:/opt/data codeship/aws-dockercfg-generator --env-file aws_creds.env /opt/data/aws_dockercfg
$ docker run -it -v /home/myuser/data:/opt/data --env-file=aws_creds.env -v /var/run/docker.sock:/var/run/docker.sock codeship/aws-dockercfg-generator/opt/data/aws.dockercfg
Logging into AWS ECR
WARNING: login credentials saved in /root/.docker/config.json
Login Succeeded
Writing Docker creds to /opt/data/aws.dockerccfg
$
```

As per AWS documentation, this dockercfg should be valid for 48 hours.
