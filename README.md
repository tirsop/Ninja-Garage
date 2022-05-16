Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

# 🤖 How to use github

=============================================================

## 🏆 2 GOLDEN RULES

=============================================================

- **Never** commit directly to master. Use feature branches

- **Always** make sure **git status is clean** before pull, checkout or merge.

=============================================================

## 🌟 how to work with git

=============================================================

1: "**git checkout master**" to move to MASTER

2: "**git pull origin master**" to update your local master to the latest

3: "**git checkout -b BRANCH-NAME**" to create and move to YOUR OWN BRANCH to work with

4: "**git branch**" to see the list of existing branches

5: Work on stuff in YOUR branch (NOT MASTER!!!)

6: "**git add**" "**git commit**" Make sure you are NOT in MASTER branch

7: "**git push origin BRANCH-NAME**"

8: "**git status**" to make sure the status is CLEAN

9: Go to github page on browser and click "Pull request"

10: If there's conflict, discuss with teamates.

11: Lead Dev merges and deletes the branch.

12: "**git checkout master**" to go back to master

13: "**git pull origin master**" to get the latest code

14: "**git sweep**" on your terminal to delete the branch from your local machine

15: "**git branch**" to see if the branch was successfully deleted

===============================================================

## 🎊 If you want the latest changes when you are in YOUR OWN BRANCH

===============================================================

1: "**git checkout master**" to move to master

2: "**git pull origin master**"

3: "**git checkout YOUR-BRANCH**" to come back to your own branch

4: "**git merge master**"

===============================================================

## ⚠️ In case of conflict

===============================================================



git status # ⚠️ ⚠️ ⚠️ Make sure it's clean before proceeding

git checkout master

git pull origin master          
#pull the latest changes

git checkout unmergeable-branch 
#switch back to your branch

git merge master                
#merge the new changes from master into your branch

#Open your text editor and solve conflicts (locate them with cmd + shift + f `<<<<<`)

#When solved, we need to finish the merge

git add .                           
#add the files in conflict

git commit --no-edit                
#commit using the default commit message

git push origin unmergeable-branch  
#push our branch again
