
# Continuous Integration / Continuous Delivery

This service works on AWS; hence you need an IAM user for CI/CD service to deploy the system.

Creation of the user is done only at the beginning; so I just provide the CloudFormation template and Makefile for this.
After you create a user, you need to create an access key.

## Create an IAM user

To create/update the user:

```sh
$ AWS_PROFILE=<YOUR_PROFILE_NAME> make deploy-ci-user
```

To create an access key for the user

```sh
$ AWS_PROFILE=<YOUR_PROFILE_NAME> make create-access-key
```

Make sure you take a memo of `SecretAccessKey` in the output. You can only see this at this timing.

To set the access key id and secret access key, do the following:

```sh
$ travis encrypt AWS_ACCESS_KEY_ID='YOUR_ACCESS_KEY_ID' --add
```
