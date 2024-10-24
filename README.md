# git-tutorial
Git tutorial made for SDU Vikings

## Git commands 
Overview of all git commands used in this tutorial
|Command                    | description   | flags    | 
|:---:                      |:---           |:---    |
|`git clone <URL>`          |Used for cloneing repositories          |jkashdjk|
|`git add /file`            |          |jkashdjk|
|`git commit`               |hihsk          |jkashdjk|
|`git push`                 |hihsk          |jkashdjk|
|`git log`                  |hihsk          |jkashdjk|
|`git switch <Name>`        |hihsk          |jkashdjk|
|`git branch <Name>`        |hihsk          |jkashdjk|
|`git rebase`               |hihsk          |jkashdjk|
|`git cherry-pick`          |hihsk          |jkashdjk|
|`git blame`                |hihsk          |jkashdjk|
|`git merge <branch name>`  |hihsk          |jkashdjk|

## What is git?
Git is essentially just a tool that can find 

* Pull requests
* CI/CD pipeline
    * Automatic testing
    * Automatic image building and publishing to docker hub or github packages

## 4 main commands of git 
    `git clone <url>`
>git clone is making clones of repositories from github into local direcotires on your own machibnes.

    
    git add \file <or> git add --all <or> git add .
>git add is a command that adds files to the staging area of git. the function 
of addiding to the staging area can be done in a coupple of different ways either
by addind individual files as shown with the command `git add /file-name` not that this also works with entire directories.
Or by adding all changes git is currently registering that has happend to the working directory with commands like `git add --all` or  `git add .` .

>Good practice for adding to the staging area is only adding files you yourself know has been ediited by yourself
this is done to ensure that no files that are not susposed  to be part of a commit is added to said commit. 
    
    git commit -m
>Git commit is what solidifies what has been added to the stagiging area and commits it to the repository. when typing in the command `git  commit -m "Some commit message"` think of it as taking what was on the staging area and making a commit to the local version of the reposotory on the machine you are currently working on. this means that if you commit some changes locally with out then pushing the commits just made, the commit just made will show up locally in the repo with the command `git log` but will not show up in the online version of the repo on git hub

    git push

>Git push takes what is in your own local commit history and applies online to the current branch that is being used on the local version. All this command does is takes your local history and apply it to the remote repository cloned from github

## Other git commands
Here is a list of other usefull git commands 
* git status 
* git log
* git rebase
* git merge
* git blame


# Git ease of life 
custom aliases for commands 
## Links for tutorials and other resources (and intermediate list of things i properly forget)
* change interactive rebase from vim to vsCode
* git gui for these features


|flags| -O | -M | -S |
|:-:| :-: | :-: | :-: |