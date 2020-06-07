# Semantic Versioning

Software versioning is the most widely adopted scheme for assigning unique version version numbers to software releases.

# semver

We practice Semantic Versioning for all projects. Using this versioning standard helps to reduce the entropy related to Dependency Hell.

[Gopher Academy](https://blog.gopheracademy.com/advent-2015/semver/)

## Semantics

Generally, all of our versions follow this convention: X.Y.Z (e.g. 1.2.3). Sometimes, we’ll use this format: X.Y.Z-branch when we need to disambiguate between versions existing in multiple branches.

**Major Releases** - These are releases when X changes. These releases will typically have major changes in the interface. These releases may not be backward-compatible.
**Minor Releases** - These are releases when Y changes. These releases bundle new features, but the interface should be largely the same. Minor releases should be backward-compatible.

**Patch Releases** - These are releases when Z changes. These releases are typically bug fixes which do not introduce new features. These releases are backward-compatible.

We use Git tags & releases for all versioning.

## Versioning

We always start projects off at 0.1.0. This is our first release of any project. While we try to keep our interfaces stable, as long as X=0, it indicates that our code does not yet have a stable API and may vary radically between minor releases.

As soon as our code reaches 1.X.Y, the interface should be relatively stable - that is not changing much between minor releases.

## Implementation

Managing semantic versions should be automated just like everything else in your infrastructure.

## Usage in Terraform Modules

Reference different module changes with semantic versioning to and reference them in your development stages:

git::ssh://git@ssh.dev.azure.com/v3/XOSS/infrastructure/xoss-terraform-labels.git?ref=v0.1.0"

After succesfull test create a pull request and merge the changes into your master branch. From there on use "master" as reference:

git::ssh://git@ssh.dev.azure.com/v3/XOSS/infrastructure/xoss-terraform-labels.git?ref=master"
