# Code Editor

> DO NOT USE VISUAL STUDIO CODE

The available extensions are not fully v0.12 functional and lack dependency support between modules.

> Use IntelliJ IDEA or PyCharm

Using these will push you to the next level and keep your heart rate from getting into the red (really bad) critical level

[IntelliJ IDEA](https://www.jetbrains.com/idea/)

# Coding Platform

We had some problems with running Terraform on Windows 0.12.24 and 0.12.25 where error messages during apply stated that we had to open a service request. 
These problems did not come up with the exact same Terraform code being run on Ubuntu 18.04 LTS.

# Lessons Learned

## Terraform Module references

Be carefull with the correct url definition if you are using Azure Repos for your Terraform modules

```
module "logging" {
  source = "git::ssh://git@ssh.dev.azure.com/v3/XOSS/infrastructure/logging"
...
}
```

##  Use one Repo per module

Separate Terraform modules and infrastructure Modules through seperated repositories.

## Never work in a team without Terraform backend configuration

Typically your Terraform state file reside locally in your Terraform working directory. If you are working on infrastruture implementations in a team you should implement a backend with state locking to prevent accidential parallel changes.

Create the backend with some easy steps:

### Create S3 Bucket

https://docs.aws.amazon.com/cli/latest/reference/s3api/create-bucket.html

```
aws s3api create-bucket --bucket e2evc-terraform-backend-bucket --region eu-central-1 --create-bucket-configuration LocationConstraint=eu-central-1
```

### Create DynamoDB table

https://docs.aws.amazon.com/cli/latest/reference/dynamodb/create-table.html

```
aws dynamodb create-table --table-name e2evc-terraform-state-lock --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5
```

### Don´t forget to import these manually created resources afterwards in Terraform

This will enable you to configure these resources with Terraform.

```
terraform import aws_s3_bucket.xoss_root_terraform_state id=e2evc-terraform-backend-bucket
terraform import aws_dynamodb_table.xoss_root_terraform_lock id=e2evc-terraform-state-lock
```

### Scrum is not for everybody

Young people and developers seem to be most enthusiastic about working in a Scrum team. For traditional operations this is a huge step into another world.
