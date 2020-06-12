This chapter should guide you in your first steps of using git. Get used to it, it is the base of all Infrastructure as Code implementations.

### Install Git

In the first step you should install git on your devices.

#### With the installer

[Git SCM](https://git-scm.com/downloads).

#### With Chocolatey

[Install Chocolatey](https://chocolatey.org/install)


First run this command:

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

Then run the second:

```
choco install git
```

####  With brew an a Mac

[Install Homebrew](https://brew.sh/)

First run this command:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

Then run the second:

```
brew install git
```

#### With WinGet (Pre-Release use at your won risk)

First go through the installation and configuration process [Use the winget tool to install and manage applications](https://docs.microsoft.com/en-us/windows/package-manager/winget/)

After this you will be able to run:

```
winget install git
```


### Glossary

It is important that you are able to identify some of the most important commands.

| Command | Description |
| -------| ---------|
| git | open source, distributed version-control system |
| commit | a snapshot of your entire repository |
| branch | a movable pointer to a commit |
| clone | a local version of a repository, including all commits and branches |
| remote | common repository that all team members use to exchange their changes |
| pull request | place to compare and discuss the differences introduced on a branch with reviews, comments and integrated tests |
| HEAD | representing your current working directory |

#### Example

Run git in the commandline.

```
% git
usage: git [--version] [--help] [-C <path>] [-c <name>=<value>]
           [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
           [-p | --paginate | -P | --no-pager] [--no-replace-objects] [--bare]
           [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
           <command> [<args>]

These are common Git commands used in various situations:

start a working area (see also: git help tutorial)
   clone     Clone a repository into a new directory
   init      Create an empty Git repository or reinitialize an existing one

work on the current change (see also: git help everyday)
   add       Add file contents to the index
   mv        Move or rename a file, a directory, or a symlink
   restore   Restore working tree files
   rm        Remove files from the working tree and from the index

examine the history and state (see also: git help revisions)
   bisect    Use binary search to find the commit that introduced a bug
   diff      Show changes between commits, commit and working tree, etc
   grep      Print lines matching a pattern
   log       Show commit logs
   show      Show various types of objects
   status    Show the working tree status

grow, mark and tweak your common history
   branch    List, create, or delete branches
   commit    Record changes to the repository
   merge     Join two or more development histories together
   rebase    Reapply commits on top of another base tip
   reset     Reset current HEAD to the specified state
   switch    Switch branches
   tag       Create, list, delete or verify a tag object signed with GPG

collaborate (see also: git help workflows)
   fetch     Download objects and refs from another repository
   pull      Fetch from and integrate with another repository or a local branch
   push      Update remote refs along with associated objects

'git help -a' and 'git help -g' list available subcommands and some
concept guides. See 'git help <command>' or 'git help <concept>'
to read about a specific subcommand or concept.
See 'git help git' for an overview of the system.

```


### Configure Environment

You should configure your local environment so that everybody gets the right contact information regarding your commits.

| Command | Description |
| -------| ---------|
| git config --global user.name "[name] | Sets the name you want attached to your commit transactions
| $ git config --global user.email "[email address]" |Sets the email you want attached to your commit transactions

### Create Repositories

You can start with a local folder or by downloading an existing git repository from Github or Azure Repos.

Example:

```
git clone https://github.com/PowerShell/DscResources.git
```

>The repository will be cloned in the current working directory of your shell. So be carefull to switch to a location that is convenient for you.

| Command | Description |
| -------| ---------|
| git init | After using the git init command, link the local repository to an empty Git repository using the following command:|
| git remote add origin URL | Turn an existing directory into a Git repository|
| git clone | Clone (download) a repository that already exists on GitHub, including all of the files, branches, and commits |

### Synchronize changes

| Command | Description |
| -------| ---------|
| git fetch | Downloads all history from the remote tracking branches |
| git merge | Combines remote tracking branches into current local branch |
| git push | Uploads all local branch commits to Git |
| git pull | Updates your current local working branch with all new commits from the corresponding remote branch on Git |

#### Naming Convention for Commit Messages

To make the history of each repo more readable and for integration reasons follow commit naming convension described below:

Each commit message should match next pattern: [CHANGE_TYPE] Azure DevOps_ID | COMMIT MESSAGE

Example: **[FIX] ID-655 | Translations changes**

Example: **[DEV] ID-6550 | Removed useless logging**

Example: **[FTR] ID-456 | Merged "Save" and "Save task" buttons in the task edit modal view**

Change type can be:  

**DEV** - For something made in dev purposes like refactoring, changes in configs, etc.

**FIX**  - For bug-fix commits

**FTR**  - For each commit which changes is a part of feature implementation.

**INT**  - For integration commits done on develop branch to avoid messy feature-branches.

**BUMP** - Technical bumping commits done by CI agent (develop branch, patch version increase) or user (minor/major versions increase) during release branch creation.

**IMP** - Improvement of components

### Branches

| Command | Description |
| -------| ---------|
| git branch [branch-name] | Creates a new branch|
| git checkout [branch-name] | Switches to the specified branch and updates the working directory|
| git merge [branch] |Combines the specified branch’s history into the current branch. This is usually done in pull requests, but is an important Git operation.|
| git branch -d [branch-name] | Deletes the specified branch|

#### Branching  

As a branching model we use the following flow:

- master branch is the basis for all the feature-branches. Each feature-branch can be merged back to master after a successful Pull-Request. Before the pull request the developer has to make sure that all requirements are met

#### Branch permissions

1 or 2 owners should be defined for each repo. Only those guys will be able to commit into develop and master branches. All other developers should create pull-requests to commit their code into develop.  

#### Code review  

Each feature can be merged into the `dev` branch only with pull-request and after code review done by somebody from repo owners.

Reviewer will:

- check if the style guide was followd
- performance issues  
- possible logical errors  
- design problems  

#### Feature Branches

The Feature Branch Workflow is a requirement for CI/CD. It’s a process by which all feature development takes place in a dedicated branch instead of the master branch. This makes it easy for multiple developers to collaborate on a particular feature while at the same time ensuring that the master branch remains stable.

##### Problem

When you’re working on a project, there will be a bunch of different features or ideas in progress at any given time, not all of which are ready for production. Further more, as business priorities change, you might need to prioritize certain features and put others on the backlog.

At the same time, business requirements mandate that you have a stable version that can be deployed at any given time. We know code can never be entirely bug-free. Furthermore, once deployed there can be unintended consequences.

##### Solution

To solve this problem, the standard workflow called branching should be used religiously. Any time a new feature is developed it must be worked on in a separate branch. When you create a branch, you’re creating an environment where you can freely test out new ideas without impacting others because changes made on a branch don’t affect the master branch.

Furthermore, no two developers should ever commit to or work on the same branch at the same time (unless they have permission from the branch stakeholder). Instead, they should create a new branch.
  
> The master branch is treated as the Holy Grail. Every effort is made to ensure it’s stable and can be deployed to production at any time.

Once a feature is considered ready, the developer submits a Pull Request (or PR) and assigns it to a peer for review.

On the surface, this is what a well-formatted Pull Request looks like:

##### Tagging

tbd

### Simple workflow to push all changes in the local branch

```
git add .
git commit -m "removed kms variables"
git tag -a "v0.1.3" -m "removed kms variables"
git push
git push --tags
```

### Further Reading

[git documentation](https://git-scm.com/)

[git-flow description](http://nvie.com/posts/a-successful-git-branching-model)

[git-flow cheatsheet](http://danielkummer.github.io/git-flow-cheatsheet/)
