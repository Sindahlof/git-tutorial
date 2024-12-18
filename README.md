# git-good tutorial
The tutorial to git-Good in SDU Vikings Driverless Sub-team
## Git commands 
Overview of all git commands used in this tutorial
|Command                    | description                                                                                                                                                   | flags    | 
|:---:                      |:---                                                                                                                                                           |:---    |
|`git clone <URL>`          |Used for cloning repositories                                                                                                                                 |none|
|`git add /file`            |Used for adding file to the staging area                                                                                                                       |--all|
|`git commit`               |used for making commits to the local repository                                                                                                                |-m|
|`git push`                 |used for coping local commits to the remote                                                                                                                    |none|
|`git log`                  |shows all earlier commit messages for current branch                                                                                                             |--online --graph|
|`git switch <Name>`        |used for switching between branches                                                                                                                             |none|
|`git branch <Name>`        |used for creating new branches                                                                                                                                 |none|
|`git rebase`               |used for rebasing current commit with other  commits or branches                                                                                                            |-I|
|`git blame`                |used for seeing what commits were made by what user or what specific line of code is made by a specific user                                                   |none|

## What is git?
Git is a version control tool, this means that git or in this case GitHub saves your files but not in a delta-based way as most other version control systems do but as a stream of snapshots and creates links between these snapshots. 
Practically git works by moving between 3 states; a working directory, a staging area and the .git directory. When cloning a repository you are copying the working directory down to you local machine, when using commands like `git add ./filePath` you are moving files into the staging area and when using `git commit` you are committing your changes to the .git directory. Those who have used git before will notice that simply making a commit does not publish the commit to GitHub this is because the command `git push` is used to push this commit to the online repository.
This is the basics of how git works, for more information go down to the [relevant links](#relevant-links) section. 


## Best practices

`Branch nameing conventions`, when naming a branch it should fall into 5 different categories: 
- `feature` : used when implementing features in the repo
- `test` : used when creating or simply testing code in a repo
- `bugfix` : used when making in dept permanent bug fixes in the code
- `hotfix` : used when making a quick non-permanent fix for an issue found in the code

These keywords will be the first part of the name for a branch, this should be followed by slash `/` and then a semantically meaningful name so that other people reading the branch name know what the branch is being used for, when naming the branch dashes `-` should be used instead of spaces. An example of this can be seen below:

    feature/rasberrypi-pwm-control-system

`Make atomic commits`, make commits that only pertain to the feature you are working on. This means if you are working on a feature and discover a bug you do not fix the bug on the feature branch but make a bug fix branch and fix the bug there, this is to ensure each branch keeps its designated scope set forth by the task it pertains to.

`commit messages`, all commit messages need to be multiline, the first line should be a short description of what is done. Short descriptions are written in imperative, "fix bug" and not "fixed bug". A longer commit messaged called the body is added below the short description, this should explain what has been done and why, but not how it has been done. This means if the descriptive text is "bug fix" the body could be something like "Fixed a bug found in the Google provided terraform module in file cloud-run-instance.tf, that made all cloud-run instance be created twice". In here you can read that the bug was fixed since it created two instances of the same resources (the why), and the message also indicates the what, the bug was fixed in the cloud-run-instance-tf file but does not describe how this was done no specifics about the file itself. Another way to think about commit messages is to future-proof your work so that anyone reading the commit message understand what is going on, even if significant time has elapsed. To ensure this here are 4 points to consider when writing a commit message.
* Why are the changes made?
* What does the change pertain to? 
* What does the changes reference?

`Pull requests`, before merging into any main branch a pull request is created and a reviewer is assigned. Before making pull requests all code is tested before making a pull request.

## GitHub Workflow
Workflows in git is a formalized way of working with branches and what strategies are used when creating branches, a couple of the most popular workflows are git workflow, GitHub workflow, GitLab workflow and one flow. In SDU Vikings Driverless subteam we work with the GitHub work flow, with a little twist. The GitHub workflow is a simple workflow were a new branch is created from the master, when all work is done, a pull request is created and the branch is merged with the main branch. The formal workflow of SDU Vikings driveless subteam are as follows:

- Created a new branch using the naming conventions mentioned earlier
- Work on the feature, bugfix, testing or hotfix depending on the work done on the branch
- Test that all new code is working as expected
- Write documentation for the branch if relevant (hot fixes, and testing might not need documentation)
- Rebase the branch with the main branch
- Open a pull request
- Pull request is reviewed and accepted, and the branch is closed (remember to use squash commit and not merge commit to keep the commit history clean)

The rebasing of the branch with main is done to ensure a linear commit history of the main branch. 

## 4 main commands of git 
    git clone <url>
>Git clone is making clones of repositories from GitHub into local directories on your own machines.

    
    git add \file <or> git add --all <or> git add .
> Git add is a command that adds files to the staging area of git. The function of adding to the staging area can be done in a couple of different ways either by adding individual files as shown with the command `git add /file-name` not that this also works with entire directories. 
> Or by adding all changes git is currently registering that has happened to the working directory with commands like `git add --all` or  `git add .`. 

> Good practice for adding to the staging area is only adding files you yourself know has been edited by yourself this is done to ensure that no files that are not supposed to be part of a commit is added to said commit. 
    
    git commit -m
> Git commit is what solidifies what has been added to the staging area and commits it to the repository. When typing in the command `git commit -m "Some commit message"`, think of it as taking what was on the staging area and making a commit to the local version of the repository, on the machine you are currently working on. This means that if you commit some changes locally without pushing the commits just made, the commit just made will show up locally in the repo with the command `git log` but will not show up in the online version of the repo on GitHub.

    git push

> Git push takes what is in your own local commit history and applies online to the current branch that is being used on the local version. All this command does is take your local history and apply it to the remote repository cloned from GitHub.

## Other git commands
Here is a list of other useful git commands 
    
    git status 
> `git status` is command that shows you the current status of the local repository you are working in, this can help you show files that have been added to the staging area, how many commits you are ahead of the remote repository. This will also show files that have been changed from the last commit recorded in the commit history.
    
    git log
>`git log` is command that shows you a log of commit history made to the repository and is good to read through before you begin work on a branch if other people have worked on it before. This command include flags like `git status --oneline` this will only show the "header" of the commit and display all commits online. Another useful flag is `git status --graph` this will show an ASCII representation of the git commit history as different branches git rebase.

    git rebase
> `git rebase` is a tool that allows you to rebase your own commit with another commit. In this context it means rewriting commit history. This feature has 2 main uses, 1 as a way to squash multiple commits together, this is done like so `git rebase -i HEAD~4` in this case 4 refers to how many commits we go back. The other is to take two branches with a common ancestor and merge these two together and making a new 3 commit that forces the two branches together and creates a new commit that can be applied to the repository, this is done like this `git rebase main development` this will rebase main onto the development branch starting from a common ancestor.
> This command is used to clean up commit history and make it easier to read for everybody and will also catch merging errors before pushing to the GitHub repository.

    git blame
>  `git blame` is way to essentially blame other people for the code they have written. This tool works simply by typing `git blame ./filename` and will show you line by line when and who made the given line in the document. This helps to find out from who and were a given part of the code came from. 

    git stash and git stash pop
>   `git stash` and `git stash pop` are ways of taking the current changes not committed on a branch removing these changes and store them temporally on the working machine, the command `git stash pop` is used to take the saved stash and apply it to the repo again, this will also remove the stored git stash.

## .gitignore files
.gitignore files are a way to make sure certain files are always excluded from being committed to a repository. To create a gitignore file use the command `touch .gitignore`, this will create an empty gitignore file. To actually ignore files you need to add what is to be ignored, the way to add file that should be ignored can be done in two main ways either based on the file extension `*.zip` by adding this to a gitignore file all .zip files in the local repository will be ignored. The other way is to do it by names `folder1` by adding this to the .gitignore file the folder named `folder1` will be ignored by git when adding to the staging area.

## Git ease of life 
When using git some commands can be rather bothersome to write out if you use git daily therefore git offers an ease of life option called aliases. Aliases are your own custom commands that git interprets in a certain way.
An alias can be set like so `git config --global alias.NameForCustomCommand Command` a more concrete example could look like this `git config --global alias.st status` with this alias you now only have to type `git st` to get the current status of your git repository.


## Relevant Links
I implore anyone reading this tutorial that mainly uses GUI tools to google the terms used as these are universal across all git GUIs used for controlling git. 

* [Git documentation](https://git-scm.com/doc)
* [Github Desktop Documentation](https://docs.github.com/en/desktop)
* [Visual Studio Code git integration documentation](https://code.visualstudio.com/docs/sourcecontrol/overview)
* Ask Jacob about clean commit history with squashing previous commits into single commits that explains what has been done.







