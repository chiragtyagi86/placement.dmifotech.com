Shortcuts for pushing the code to the main branch


first clone the branch 
and switch the branch to your branch(darshil/chirag/dhruv)
make the changes
push the code to your branch

ask merger(chirag/darshil) to merge your branch changes with the main branch

now INSHORT FETCH CODE FROM MAIN and merge it to your branch

git fetch origin
git checkout main(optional)
git pull origin main
git checkout darshil (optional)
git merge main

then,

git switch branch -C (darshil/chirag/dhruv)
git add .
git commit -m "made change"
git push origin (darshil/chirag/dhruv)


dhruv added a line


