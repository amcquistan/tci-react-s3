#!/bin/bash

# exit when any command fails
set -eE -o functrace

if [[ -z $REACT_BKT_NAME  ]]; then
  printf "Environment variable REACT_BKT_NAME missing\n"
  exit 1
fi

if [[ -z $AWS_PROFILE ]]; then
  printf "Environment variable AWS_PROFILE missing\n"
  exit 1
fi

set -x

aws s3 rm s3://$REACT_BKT_NAME/ --recursive --profile $AWS_PROFILE

aws s3 cp ./build s3://$REACT_BKT_NAME/ --recursive --profile $AWS_PROFILE

BKT_URL="http://$REACT_BKT_NAME.s3-website.$AWS_REGION.amazonaws.com"

printf "\n\nDeployed to: $BKT_URL\n\n"
