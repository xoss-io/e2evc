# Platform Management

The tool you choose to deploy your infrastructure is dependend on what your requirements are. 
If you are running on one infrastructure it is perfectly fine to use Cloudformation an AWS, Azure ARM on Azure or SCCM on your on-premises infrastructure.

> For those using SCCM: Is this the software deployment tool that is capable of managing you infrastructure deployments in the future. You should think about a mindest change.

> If you are thinking about multi-cloud you should definitely have a look at Terraform

## Getting Started

### Installation process

#### Setting up Terraform

1. Install AWS CLI
2. Install Terraform CLI from https://www.terraform.io
3. Copy terraform cli to repo folder or adjust PATH environment variable by executing the following command:

```bash
 # Linux (bash)
 # Add this command to your ~/.bashrc file to have a permanent
 export PATH="$PATH:<path to terraform binary>"
```

```PowerShell
 # Windows (PowerShell)
 [Environment]::SetEnvironmentVariable("PATH", "$ENV:PATH;<path to terraform binary .exe>", "USER")
```

```PowerShell
 # Windows (Commandline)
 setx PATH "$env:path;<path to terraform binary .exe>" -m
```

4. Configure aws credentials: https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html

```
 aws configure --profile dl-[dev|qa|prod]
```

5. Clone repo to local disk
 
6. Change directory to repo directory:

```
 cd [repo path]
```

7. Change directory to environment directory:

```
 cd environments/[dev|qa|prod]
```

### Initialize Terraform

* run: `terraform init`
* select terraform workspace: `terraform workspace select <env>` where env eq [dev|qa|prod]
* run: `terraform plan` to see updates
* run: `terraform apply` to send updates
* run: `terraform destroy` to remove complete environment

## Software dependencies

[AWS CLI](https://aws.amazon.com/de/cli/)

## Configure a backend if you are working in a team

### Create S3 Bucket
https://docs.aws.amazon.com/cli/latest/reference/s3api/create-bucket.html

aws s3api create-bucket --bucket xoss-infraxo-prd-terraform-state-ACCOUNTID --region eu-central-1 --create-bucket-configuration LocationConstraint=eu-central-1

DynamoDB
https://docs.aws.amazon.com/cli/latest/reference/dynamodb/index.html

Create DynamoDB table
https://docs.aws.amazon.com/cli/latest/reference/dynamodb/create-table.html

aws dynamodb create-table --table-name xoss-infraxo-prd-terraform-state-lock --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5

```
terraform import aws_s3_bucket.xoss-infraxo-prd-terraform-state-ACCOUNTID id=xoss-infraxo-prd-terraform-state-ACCOUNTID
terraform import aws_dynamodb_table.xoss_root_terraform_lock id=xoss-root-terraform-lock
```

```
# XOSS Terraform Version Requirements and Backend Configuration
# ----------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12"
  backend "s3" {
    bucket = "xoss-infraxo-prd-terraform-state-ACCOUNTID"
    key    = "terraform-state.tf"
    region = "eu-central-1"

  }
}
```

## NUKE

AWS Nuke (delete everything inside an account)

https://github.com/rebuy-de/aws-nuke