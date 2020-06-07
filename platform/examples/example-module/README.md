# Introduction

This is a module to create administrative users with access keys in AWS. The created users are moved in to a created administrative groups and are assigned administrative access (full access).

# Getting Started

Open the main.auto.tfvars file and adjust the following lines to your own needs:

administrative_users  = ["xoss-admin-access", "xoss-svc-terraform"]
administrative_group  = "xoss-admin-access"
group_membership_name = "xoss-admin-access"

# Build and Test

If you want to host your Terraform module in Azure DevOps follow these steps the get ssh access for your Pipelines:

[Authenticate with SSH](https://docs.microsoft.com/en-us/azure/devops/repos/git/use-ssh-keys-to-authenticate?view=azure-devops&tabs=current-page)

Implement the module into your own code (remember to adjust the link because our modules are not publicly available):

## Example

```
module "iam_users_management" {
  source = "git::ssh://git@ssh.dev.azure.com/v3/XOSS/INFRASTRUCTURE/xoss-organizations-administrative-users"
  administrative_users  = var.administrative_users
  administrative_group  = var.administrative_group
  group_membership_name = var.group_membership_name
}
```

# Feedback

Follow @xoss_io and let us know what you think!
