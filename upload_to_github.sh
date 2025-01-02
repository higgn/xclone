#!/bin/bash

# Initialize the Git repository if not already initialized
if [ ! -d .git ]; then
    git init
fi

# Add and commit each directory separately
for folder in */ ; do
    git add "$folder"
    git commit -m "Added directory $folder"
done

# Add and commit each file separately
for file in *.* ; do
    git add "$file"
    git commit -m "Added file $file"
done

# Add the remote repository if not already added
if ! git remote | grep origin; then
    git remote add origin https://github.com/higgn/xclone.git
fi

# Push the commits to the master branch
git push -u origin master
