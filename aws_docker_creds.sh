#!/bin/bash

set -e

echo 'AWS ECR dockercfg generator'

: "${AWS_REGION:?Need to set AWS_REGION}"
: "${AWS_ACCESS_KEY_ID:?Need to set AWS_ACCESS_KEY_ID}"
: "${AWS_SECRET_ACCESS_KEY:?Need to set AWS_SECRET_ACCESS_KEY}"

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

