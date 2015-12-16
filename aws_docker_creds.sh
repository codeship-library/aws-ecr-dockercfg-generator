#!/bin/bash

cat << EOF > ~/.aws/config
[default]
region = $AWS_REGION
EOF

# fetching aws docker login
echo "Logging into AWS ECR"
$(aws ecr get-login)

# writing aws docker creds to desired path
echo "Writing Docker creds to $1"
cp ~/.docker/config.json $1

