# git-good tutorial
The tutorial to git-Good in SDU Vikings Driverless Sub-team

## Git commands 
Overview of all git commands used in this tutorial
|Command                    | description                                                                                                                                                   | flags    | 
|:---:                      |:---                                                                                                                                                           |:---    |
|`git clone <URL>`          |Used for cloneing repositories                                                                                                                                 |none|
|`git add /file`            |Used for adding file to the staging area                                                                                                                       |--all|
|`git commit`               |used for making commits to the local repository                                                                                                                |-m|
|`git push`                 |used for coping local commits to the remote                                                                                                                    |none|
|`git log`                  |shows all ealire commit messages for curren branch                                                                                                             |--oneline --graph|
|`git switch <Name>`        |used for switching between banches                                                                                                                             |none|
|`git branch <Name>`        |used for creating new branches                                                                                                                                 |none|
|`git rebase`               |used for rebasing current commit with other commits                                                                                                            |-I|
|`git blame`                |used for seeing what commits were made by what user or what specific line of code is made by a specific user                                                   |none|

## What is git?
Git is essentially just a tool that can find 

* Pull requests
* CI/CD pipeline
    * Automatic testing
    * Automatic image building and publishing to docker hub or github packages

## Best practices
Make atomic commits, make commits that only perterain to the feature you are working on. 

Branch nameing conventions, when naming a branch it should fall into 5 different catogoriez: 
- `feature` : used when implementing features in the repo
- `test` : used when creating or simply testing code in a repo
- `bugfix` : used when making indept permenent bug fixes in the code
- `hotfix` : used when making a quick non permenant fix for an issue found in the code

theses keywords will be the first part of the name for a branch, this should be followed by slash `/` and then a semantically sound name so that other people reading the branch name know what the branch is being used for, when naming the branch dashes `-` should be used instead of spaces. an example of this can be seen below:

    feature/rasberrypi-pwm-control-system


commit messages, all commit messages needs to be multiline, the first line should be a short discription of what is done. Short descriptions are written in imparative, "fix bug" and not "fixed bug". a longer commit messaged called the body is added below the short description, this should explain what has been done and why, but not how it has been done.

Pull requests, before merging into any main branch a pull request is created and a reviewer is assigned. Before making pull requests all code is tested before making a pull request.

## Github Workflow
workflows in git is a formilized ay of working with branches and what stradegies is used when creating branches, a couple of the most popular workflows are git workflow, github workflow, gitlab workflow and one flow. In sdu vikings we work with the github work flow, with a little twists. The github workflow is a simple workflow were a new branch is created from the master, when all work is done, a pull request is created and the branch is merged with the main branch. the formal workflow of sdu vikings driveless subteam are as follows.q

- created a new branch using the naming conventions mentioned ealier
- Work on the the feature, bugfix, testing or hotfix depending on the work done on the branch
- test that all new code is working as expected
- write documentation for the documentation if relevant (hot fixes, and testing might not need documentation)
- rebase the branch with the main branch
- open a pull request
- pull request is reviewed and accepted and the branch is closed (remember to use squash commit and not merge commit to keep the commit history clean)

The rebasing of the branch with main is done to ensure a linear commit history of the main branch.

## 4 main commands of git 
    git clone <url>
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
    
    git status 
>`git status` is command that shows you the current status of the local repository you are working in, this can help you show files that have been added to to staging area, how many commits you are ahead of the remote repository. this will also show files that have been changed from the last commit recorded in the commit history.
    
    git log
>`git log` is command that shows you a log of commit history made to the repitory and is good to read through berfore you begin work on a branch if other people has made work on it before. This command include flags like  `git status --oneline` this will only show the "header" of the commit and display all commits in oneline. another usefull flag is `git status --graph` this will show an ascii representation of the git commit history as different branches git rebase

    git rebase
> `git rebase` is a tool that allows you to rebase your own commit with another commit. In this context it means rewriting commit history. this feature has 2 main uses, 1 as a way to squash mutiple commits togehter, this is done like so `git rebase -i HEAD~4` in this case 4 referes to how many commits we go back. The other is to take two branches with a common anecstor and merge these two togehter and making a new 3 commit that forces the two branches togehter and creates a new commit that can be applied to the repostory, this is done like this `git rebase main development` this will rebase main onto the development branch starting from a common anecsetor. 
This command is used to clean up commit history and make it eaiser to read for everybody and will also catch merging errors before pushing to the github repository.  

    git blame
>  `git blame` is way to essentially blame other people for the code they have written. This tool works simply by typing `git blame ./filename` and will show you line by line when and who made the given line in the document. this helps to find out from who and were a given part of the code came from.


# Git ease of life 
When using git some commands can be rather bothersome to write out if you use git daily therefore git offeres an ease of life option called aliasses. Aliasses are your own custom commands that git interpets in a certain way.
an aliass can be set like so `git config --global alias.NameForCustomCommand Command` a more concrete example could look like this `git config --global alias.st status` with this alias you now only have to type `git st` to get the current status of your git repostory.



## Links for tutorials and other resources (and intermediate list of things i properly forget)
* change interactive rebase from vim to vsCode
* git gui for these features



