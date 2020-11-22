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

if [[ -z $AWS_REGION ]]; then
  printf "Environment variable AWS_REGION missing\n"
  exit 1
fi

set -x

aws s3api create-bucket \
  --bucket $REACT_BKT_NAME \
  --region $AWS_REGION \
  --acl public-read \
  --create-bucket-configuration LocationConstraint=$AWS_REGION \
  --profile $AWS_PROFILE

aws s3 website s3://$REACT_BKT_NAME \
  --index-document index.html \
  --error-document index.html \
  --profile $AWS_PROFILE

aws s3api put-bucket-policy \
  --bucket $REACT_BKT_NAME \
  --policy "{\"Statement\": [{\"Effect\": \"Allow\", \"Principal\": \"*\", \"Action\": \"s3:GetObject\",\"Resource\": \"arn:aws:s3:::$REACT_BKT_NAME/*\"}]}" \
  --profile $AWS_PROFILE

BKT_URL="http://$REACT_BKT_NAME.s3-website.$AWS_REGION.amazonaws.com"

BTK_URL_FILE=$(pwd)/$REACT_BKT_NAME.txt

printf "Bucket website url $BKT_URL saving to $BTK_URL_FILE\n"

echo $BKT_URL > $BTK_URL_FILE
