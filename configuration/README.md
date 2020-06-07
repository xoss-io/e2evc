# Configuration Management

## What is PowerShell DSC

„PowerShell DSC is an inbuild tool to configure target machines”

## History

### PowerShell v2

- Created from project "Monad"
- Introduction of remoting
- introduction of background jobs

### PowerShell v3

- automatic module detection
- scheduler
- module repositories
- OneGet PowerShell module

### PowerShell v4

- new execution policies
- extended roaming
- policy based configuration
- easier access to file structures
- DSC v1

### PowerShell v5
 - DSC v2
 - partial configurations
 - encryption
 - PowerShell classes
 - deep integration with .NET framework
 
 ## Why should you use it?
 
 - classic domain environments are loosing importance
 - rise of cloud native environments
 - requirement of quick deployments
 - detect configuration drifts
 - push / pull configurations
 
 ## Alternatives
 
 - Puppet
 - Salt
 
 ## Why you really should use it?
 
 - configurationmanagement at scale
 - simple proxy implementation (web proxy with https)
 - environment specific configuration
 - domain independent configuration
 - runs in kernel mode
 - use it natively on every Windows system with WMF 5.1
 - dependency awareness between nodes and conditions
 - extensibility because it is based on PowerShell
 
 - Get rid of GPOs
 - configuration sets
 - no hierarchy or inheritance
 - state is defined
 
 > GPOs are so 90ies

## Infrastructure as Code

- PowerShell syntax
- descriptive configuration
- separation of configuration definition and implementation

## What if i miss functionality?

- extend with your own scripts
- universality
- extend with PowerShell

## CI /CD integration

- Azure DevOps Pipelines

## automatic testing 

- [NUnit](https://nunit.org/) 
- [Pester](https://pester.dev/)

## Terminology

### Configuration

This s the configuration block.

### Node

This is the configuration item within a configuration.

### Module

Independend module that can be imported for further usage.

### Pull mode

A node pulls a configuration from a configuration endpoint (e.g. DSC Pull server). Automated process with defined pull intervalls.

### Push mode

A configuration is send to a node. This is a manual process initiated by an administrator.

### Local Configuration Manager

The client component of DSC that configures the node.

### Pull server

The "management" server that serves as endpoint for nodes and manages modules and configurations.

## How to dive quickly into PowerShell DSC?

- [Lability](https://github.com/VirtualEngine/Lability)
- [PS-Autolab-Env](https://github.com/pluralsight/PS-AutoLab-Env)
- [XenDesktop7](https://github.com/VirtualEngine/XenDesktop7)
- [FSLogixDsc](https://github.com/VirtualEngine/FSLogixDsc)

