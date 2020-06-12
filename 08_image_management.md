

There are a few different concepts of providing operating system images, that depend on your use case:

- vanilla os provided by the cloud provider or an iso on-premises (yes some people still do this)
- prepare a template that is used to provision new os instances (e.g. vSphere template, Custom AMI)
- Create or use an image pipeline (depending on your needs)
    - [EC2 Image Builder](https://aws.amazon.com/de/image-builder/)
    - [Azure Image Builder](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/image-builder-overview)
    - create your own image builder Pipeine with Packer on-premises or with Azure DevOps Pipelines or AWS Codebuild

## staging your images

- create a patched base image
    - build role based images on top
        - baseline configurations
        - functional roles
            - VDAs (golden images)
            - Web servers
            
## The Concept of Immutable Infrastructure

Packer provides the baseline technology to leverage the concept of immutable infrastructures. Create an image and use it as long as the next updates are on the roadmap.
Then recreate a new image and replace the ols one. This concept is not working with all infrastructure components but with the ones that don´t have staefull data.

[Read more about immutable infrastructure](https://www.hashicorp.com/resources/what-is-mutable-vs-immutable-infrastructure/)

## Application installation

Its your choice. You can use everything from e.g. Chocolatey, Winget (not production ready yet), PowerShell scripts, PowerShell AppDeploymentToolkit.

## Packer Basics

**Artifacts** are the results of a single build, and are usually a set of IDs or files to represent a machine image. Every builder produces a single artifact. As an example, in the case of the Amazon EC2 builder, the artifact is a set of AMI IDs (one per region). For the VMware builder, the artifact is a directory of files comprising the created virtual machine.

**Builds** are a single task that eventually produces an image for a single platform. Multiple builds run in parallel. Example usage in a sentence: "The Packer build produced an AMI to run our web application." Or: "Packer is running the builds now for VMware, AWS, and VirtualBox."

**Builders** are components of Packer that are able to create a machine image for a single platform. Builders read in some configuration and use that to run and generate a machine image. A builder is invoked as part of a build in order to create the actual resulting images. Example builders include VirtualBox, VMware, and Amazon EC2. Builders can be created and added to Packer in the form of plugins.

**Commands** are sub-commands for the packer program that perform some job. An example command is "build", which is invoked as packer build. Packer ships with a set of commands out of the box in order to define its command-line interface.

**Post-processors** are components of Packer that take the result of a builder or another post-processor and process that to create a new artifact. Examples of post-processors are compress to compress artifacts, upload to upload artifacts, etc.

**Provisioners** are components of Packer that install and configure software within a running machine prior to that machine being turned into a static image. They perform the major work of making the image contain useful software. Example provisioners include shell scripts, Chef, Puppet, etc.

**Templates** are JSON files which define one or more builds by configuring the various components of Packer. Packer is able to read a template and use that information to create multiple machine images in parallel.

### Example

```
{
    "variables": {
        "IMAGE_NAME": "MyTestImage",
        "Revision": "010",
        "AWS_REGION": "eu-central-1",
        "AWS_ACCESS_KEY": "AKIAXXXXXXX",
        "AWS_SECRET": "SECRETXXXXXXXXXX",
        "AWS_SOURCE_AMI": "ami-3d787d57"
    },
    "builders": [{
        "type": "amazon-ebs",
        "region": "{{ user AWS_REGION }}",
        "source_ami": "{{ user AWS_SOURCE_AMI }}",
        "instance_type": "m3.medium",
        "ami_name": "{{user IMAGE_NAME}}",
        "communicator": "winrm",
        "winrm_username": "Administrator"
    }],
    "provisioners": [{
            "type": "windows-update",
            "search_criteria": "IsInstalled=0",
            "filters": [
                "exclude:$_.Title -like '*Preview*'",
                "include:$true"
            ],
            "update_limit": 25
        },
        {
            "type": "powershell",
            "inline": "C:\\Windows\\System32\\Sysprep\\Sysprep.exe /oobe /shutdown /generalize"
        }
    ],
    "post-processors": [{
        "type": "manifest",
        "output": "manifest.json",
        "strip_path": true
    }]
}
```

## Installation

### With Chocolatey

```
#Used from https://chocolatey.org/docs/installation
Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install packer
```

### With PowerShell

```
$Version = "1.5.5"
$Filename = "packer_${Version}_windows_amd64.zip"
Invoke-WebRequest -Uri "https://releases.hashicorp.com/packer/$Version/$Filename" -OutFile ".\$Filename"
Expand-Archive -Path ".\$Filename"  -DestinationPath ".\"
Remove-Item ".\$Filename"

.\packer.exe version
```

## More Information

[Packer.io](https://www.packer.io/)