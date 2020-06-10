# Agenda

## Prerequisites

### Git

Git is the forst pillar for everything we do in a fully automated Infrastructure as Code environment. So we should talk about some basics.

### MarkDown

MarkDown is the second pillar in this space. Infrastructure as Code without documentation might leave you lost in the jungle of tools, processes and technologies.

### Semantic Versioning

Versioning should be used in all modules and applications that you and your colleagues build.

## Image Management

If you want to run workloads on on-premises or cloud infrastructures you should implement customized operating system images.

There are a few different concepts of providing operating system images, that depend on your use case:

- vanilla os provided by the cloud provider or an iso on-premises (yes some people still do this)
- prepare a template that is used to provision new os instances (e.g. vSphere template, Azure Image Builder or) manually
- Create or use an image pipeline (depending on your needs)
    - [EC2 Image Builder](https://aws.amazon.com/de/image-builder/)
    - [Azure Image Builder](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/image-builder-overview)
    - create your own image builder Pipeine with Packer on-premises or with Azure DevOps Pipelines or AWS Codebuild

### staging your images

- create a patched base image
    - build role based images on top
        - baseline configurations
        - functional roles
            - VDAs (golden images)
            - Web servers
            
### Immutable Infrastructure 
    
Packer provides the baseline technology to leverage the concept of immutable infrastructures. Create an image and use it as long as the next updates are on the roadmap. 
Then recreate a new image and replace the ols one. This concept is not working with all infrastructure components but with the ones that don´t have staefull data. 

[Read more about immutable infrastructure](https://www.hashicorp.com/resources/what-is-mutable-vs-immutable-infrastructure/)

### Application installation

It´s your choice. You can use everything from e.g. Chocolatey, Winget (not production ready yet), PowerShell scripts, PowerShell AppDeploymentToolkit.

## Platform Management

The tool you choose to deploy your infrastructure is dependend on what your requirements are. 
If you are running on one infrastructure it is perfectly fine to use Cloudformation an AWS, Azure ARM on Azure or SCCM on your on-premises infrastructure.

> For those using SCCM: Is this the software deployment tool that is capable of managing you infrastructure deployments in the future. You should think about a mindest change.

> If you are thinking about multi-cloud you should definitely have a look at Terraform.


## Configuration Management

When operating system images are ready and the basic infrastructure is provisioned it is time to configure the nodes and bring the infrastructure to life.

We will use PowerShell DSC in this session to prepare all Citrix Infrastructure roles, install all applications and configure the site. 