#!/bin/bash

git remote add upstream git@github.com:ClipboardHealth/dotfiles.git
git fetch upstream
git merge upstream/main -m "Merge the latest changes from upstream ($(date +%Y-%m-%d))"