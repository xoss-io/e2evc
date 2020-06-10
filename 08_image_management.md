

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