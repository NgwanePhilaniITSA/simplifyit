**Manual git commands**

## To Publish New Repo
git init
git status
git add .
git commit -m "commit message"
Now go create your remote repo on your git hub account and copy it **URL** once done.
git remote add origin **then you remote repo link here**
git remote -v
git branch -M main/dev
git push -u origin main/dev

## To publish your new changes on existing repo
git add .
git commit -m "commit message"
git push

## Switch to existing Branch
git branch
git checkout branch-name **OR** git switch branch-name
_Replace branch-name with the name of the branch you want to switch to_


## Switch none existing Branch
git checkout -b new-branch-name **OR** git switch -c new-branch-name
git push -u origin new-branch-name


## To pull origin of the current branch
_Check the branch name first_
git branch
_Replace branch-name with the branch you want to pull origin off_
git pull origin branch-name

## To update new branch with main/dev branch changes
_Switch to the branch that will be update_
git checkout NewBranchName **OR** git switch NewBranchName
_Pull latest changes_
git pull origin main
_Resolve any merge conflicts as git will notify you_
git add filename **that you resolve conflict off**
git push origin NewBranchName


##More About Flutter Libriaries
https://fluttergems.dev/
