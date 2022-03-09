# This file contains the custom git functions gitc, gitb, and gitp
# Which are replacements for the standard git commit, git checkout, and git push with some extra features
# See the help files below for more info about the features of each function

# Custom git push function
# Allows automatic creation of an upstream branch
function gitp() {
  if ! git status >/dev/null; then
    echo "This function only works inside a git repository"
    return 1
  fi;
  if [[ "$1" = "--help" ]]; then
    cat <<HELP
Git push utility
usage: gitp [-f]

Pushes your local branch to remote ("git push").
If no remote exists, it will offer to create it.
Use "-f" for "git push --force"
HELP
    return
  fi

  # Allow force-pushing
  if [[ "$1" = "-f" ]] || [[ "$1" = "--force" ]]; then
    git push -f
    return
  fi
  git push
  # This exit code corresponds to the 'no upstream' error
  if [[ "$?" -eq 128 ]]; then
    branch_name=$(git rev-parse --abbrev-ref HEAD)
    # Print confirmation message
    echo "No upstream found for '$branch_name'."
    echo "Would you like to create one? [y/N]?"
    stty raw -echo
    confirmation=$(dd bs=1 count=1 2>/dev/null)
    stty sane
    echo ""
    # If a 'y' was entered, create a new upstream
    if [[ "$confirmation" = "y" ]] || [[ "$confirmation" = "Y" ]]; then
      git push -u origin "$branch_name"
    else
      echo "Upstream was not created."
    fi
  fi
}

# Custom git commit function
# It's shorter to type
function gitc() {
  if ! git status >/dev/null; then
    echo "This function only works inside a git repository"
    return 1
  fi;
  if [[ "$1" = "--help" ]]; then
    cat <<HELP
Git commit utility
usage: gitc [-m message]

Commits your staged changes ("git commit").
Add "-m message" for "git commit -m 'message'"
HELP
    return
  fi
  if [ -z "$1" ]; then #if no commit message is supplied
    git commit
  else
    git commit -m "$1"
  fi
}

function rebase_with_confirmation() {
  target=$1
  current_branch=$(git rev-parse --abbrev-ref HEAD)
  echo "Rebase onto $target? [y/N]"
  stty raw -echo
  confirmation=$(dd bs=1 count=1 2>/dev/null)
  stty sane
  echo ""
  # If a 'y' was entered, rebase onto the branch
  if [[ "$confirmation" = "y" ]] || [[ "$confirmation" = "Y" ]]; then
    echo "First, pulling the latest changes from origin/$target."
    git checkout $target &>/dev/null
    if [[ $? -ne 0 ]]; then
      return
    fi
    git pull
    echo ""
    if [[ "$?" -eq 0 ]]; then
      echo "Commencing rebase."
      git checkout $current_branch &>/dev/null
      git rebase $target
    else
      echo "Rebase failed because $target could not be updated to the latest version."
      git checkout $current_branch
    fi
  else
    echo "Rebase cancelled"
  fi
}

function delete_with_confirmation() {
  target=$1
  echo "Are you sure you want to delete $target? [y/N]"
  stty raw -echo
  confirmation=$(dd bs=1 count=1 2>/dev/null)
  stty sane
  echo ""
  # If a 'y' was entered, delete the branch
  if [[ "$confirmation" = "y" ]] || [[ "$confirmation" = "Y" ]]; then
    git branch -D "$target"
  else
    echo "Branch was not deleted."
  fi
}

# Custom git branch management function
# Allows you to find a branch based on partial name match
# Allows you to create new branches from the same function
# Allows deleting by supplying -D before the name
# Allows rebasing onto a target by supplying -R before the name
function gitb() {
  if ! git status >/dev/null; then
    echo "This function only works inside a git repository"
    return 1
  fi;
  # If no branch name is supplied
  # list all local branches
  if [ -z "$1" ]; then
    branches=($(git for-each-ref --format='%(refname:short)'))
    echo "Listing all branches:"
    for i in "${branches[@]}"; do
      echo "$i"
    done
    return
  fi

  if [[ "$1" = "--help" ]]; then
    cat <<HELP
Git branch management utility
usage: gitb [-D | -R] [query]

If query is not supplied, lists all branches.

If query is '-' (gitb -), returns you to the last branch you were on.

'query' only needs to match part of the name.
For example, "gitb 185" will allow you to reference SVD-185/long-name
If there are multiple matches, you'll be prompted to try again.

-D: delete
"gitb -D query" expands to "git branch -D matching_branch_name"

-R: rebase
"gitb -R query" expands to "git rebase matching_branch_name"

Neither -D or -R: checkout
If there's a match, "gitb query" expands to "git checkout matching_branch_name"
If there are no matches, it expands to "git checkout -b query"
HELP
    return
  fi

  if [[ "$1" = - ]]; then
    git checkout -
    return
  fi

  # Handle delete and rebase commands
  if [[ "$1" = "-D" ]] || [[ "$1" = "-R" ]]; then
    export branch_name=$2
  else
    export branch_name=$1
  fi
  name=$branch_name
  unset branch_name
  # Retrieve a list of all branch names
  # Search for the name provided
  # Then store in an array
  branches=($(git for-each-ref --format='%(refname:short)' | grep "$name"))

  # If there were no matching branches
  if [[ "${#branches[@]}" -eq 0 ]]; then
    # Handle delete command
    if [[ "$1" = -D ]]; then
      echo "Error deleting - could not find a branch named $name"
      return
    fi
    # Handle rebase command
    if [[ "$1" = -R ]]; then
      echo "Error rebasing - could not find a branch named $name"
      return
    fi
    # Offer to create a new branch
    echo "Create a new branch named '$name'? [y/N]"
    stty raw -echo
    confirmation=$(dd bs=1 count=1 2>/dev/null)
    stty sane
    echo ""
    # If a 'y' was entered, create a new branch
    if [[ "$confirmation" = "y" ]] || [[ "$confirmation" = "Y" ]]; then
      git checkout -b "$name"
    fi
    return
  fi

  # If there was at least one match
  # filter the matches to remove redundant 'origin/' refs
  for i in "${branches[@]}"; do
    # Local refs - add them to the list
    if [[ "$i" != origin/* ]]; then
      new_branches+=("$i")
    else
      # Origin refs - first remove the 'origin/'
      tmp=$(echo "$i" | cut -c 8-)
      # Then see if this ref already exists locally
      # If it doesn't, add it to the list
      if [[ ! " ${new_branches[@]} " =~ " ${tmp} " ]]; then
        new_branches+=("$tmp")
      fi
    fi
  done
  branches=("${new_branches[@]}")
  unset new_branches

  # If there was exactly one matching branch, switch to it (or rebase or delete)
  if [[ "${#branches[@]}" -eq 1 ]]; then
    # Handle delete command
    if [[ "$1" = -D ]]; then
      delete_with_confirmation ${branches[@]:0:1}
      return
    # Handle rebase command
    elif [[ "$1" = -R ]]; then
      rebase_with_confirmation ${branches[@]:0:1}
      return
    else
      git checkout "${branches[@]:0:1}"
      return
    fi
  fi

  # Multiple matching branches:

  # First, list the matches
  echo ""
  echo "Found multiple matching branches:"
  for i in "${branches[@]}"; do
    echo $i
  done
  echo ""

  # Try deleting or rebasing using exact branch name
  # Handle delete command
  if [[ "$1" = -D ]]; then
    delete_with_confirmation $name
    return
  # Handle rebase command
  elif [[ "$1" = -R ]]; then
    rebase_with_confirmation $name
    return
  fi

  # Try checking out the branch name as entered,
  # saving both errors and stdout to a temp file
  git checkout "$name" >/tmp/msg.txt 2>&1

  # If we successfully swapped branches
  if [[ "$?" -eq 0 ]]; then
    # Print the original message
    echo $(cat /tmp/msg.txt)
    echo ""
    echo "If you wanted a different branch, try again using its full name."
    return
  fi

  ERR_MSG=$(cat /tmp/msg.txt)
  # If the error message *wasn't* the result of the branch not existing
  if [[ ! "$ERR_MSG" =~ pathspec ]]; then
    # Print the error and exit
    echo $ERR_MSG
    return 1
  fi

  # Otherwise, ask for a new name and try again
  echo "Enter the name of your desired branch:"
  read new_branch_name
  gitb "$new_branch_name"
}