
# Boilerplate Example for React App on S3

This is a simple demo app for creating and installing react on S3

React app scafolding was generated with Create React App

Only compatible with *nix style operating systems (ie, Linux / Mac OSX)

### Setup and Running Example

1) clone repo

```
git clone https://github.com/amcquistan/tci-react-s3.git
cd tci-react-s3
```

2) install npm packages

```
npm install
```

3) Install aws cli

Consult [AWS CLI docs](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) and configure with IAM user who can perform full programmatic CRUD on S3 within the associated AWS account

4) Create the following environment variables

```
REACT_BKT_NAME=name-of-bucket-to-host-from
AWS_PROFILE=aws-profile-to-utilize
AWS_REGION=aws-region-for-bucket
```

5) Run locally

```
npm run start
```

6) Create an S3 bucket for hosting a static website

```
npm run createbkt
```

7) Deploy example app to bucket

```
npm run deploy
```

8) Clean up and delete bucket

```
npm run deletebkt
```
