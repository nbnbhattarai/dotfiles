# Clipboard Health Starter Dotfiles
This repository contains an opinionated set of shell customization settings (dotfiles) which we believe will lead to an optimal shell experience. Feel free to use them as a starting point for your own customizations, an inspiration to build a similar repo from scratch, or to ignore this feature entirely.

# Getting Started
## Create your own copy of this repo
Your own dotfiles repo should be private, since it might contain SSH keys and other secret information. _DON'T_ fork this repo - instead follow these steps to create your own copy:
1. [Create a new personal repo](https://github.com/new) named `dotfiles` (or whatever you'd like)
2. Make sure that repo is PRIVATE
3. [Duplicate the repo](https://docs.github.com/en/repositories/creating-and-managing-repositories/duplicating-a-repository):
```
git clone --bare git@github.com:ClipboardHealth/dotfiles.git
cd dotfiles
git push --mirror git@github.com:YOUR_USERNAME/dotfiles.git
cd .. && rm -rf dotfiles.git
git clone git@github.com:YOUR_USERNAME/dotfiles.git
code dotfiles
```
## Add your SSH keys
GitHub has deprecated HTTPS cloning, so you will need your SSH keys on any development machine:
1. [Create an SSH Key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and [add it to GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) (if you haven't already)
2. Copy your `id_rsa` and `id_rsa.pub` to `.ssh` in this repo, commit the changes, and push.
## Apply further customizations
- Add any scripts that you want to run when setting up a new machine to [`install.sh`](install.sh)
- Copy any shell aliases/functions you like to the [`.zshrc`](home/.zshrc) (you could also use a `.bashrc`, but why would you?).
## Use these dotfiles in GitHub Codespaces
0. Codespaces must be enabled - this is an organization-wide setting which should be turned on for ClipboardHealth.
1. Go to [your settings](https://github.com/settings/codespaces)
2. Enable Dotfile support and select this repo:
![image](https://user-images.githubusercontent.com/7649736/157506457-79949742-2585-4e73-ab50-6e5962e0ce5f.png)

## Use these dotfiles locally
This repo is designed to work with [homesick](https://github.com/technicalpickles/homesick), although it should be adaptable to work with [any of GitHub's recommended dotfile-management tools](https://dotfiles.github.io/utilities/).
To use this with `homesick` (requires `ruby`):
1. Install [ruby](https://www.ruby-lang.org/en/documentation/installation/)
2. Install homesick and clone your repo
```
gem install homesick
homesick clone YOUR_GITHUB_USERNAME/dotfiles
```
3. Navigate to the location of the dotfiles repo (opens a new shell)
```
homesick cd dotfiles
```
4. Run the installation script without copying the doftiles themselves.
```
./install.sh local
```
5 Link the dotfiles in `home/` to your local `~`
```
homesick link dotfiles
```
# Staying up-to-date
You can update your repo with the latest changes to this one at any time by running:
```
./update.sh
# Then, manage any merge conflicts that arise (if any)
git push
```
# Included Features
- [Oh-my-zsh](https://ohmyz.sh/) with the [autosuggestions](https://github.com/zsh-users/zsh-autosuggestions#readme) and [syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting#readme) plugins and a customized [agnoster](https://github.com/agnoster/agnoster-zsh-theme#readme) theme
- [A script to auto-load your SSH key on startup so you only need to enter its password once](home/custom-shell-scripts/ssh-agent.sh)
- [`thefuck`](https://github.com/nvbn/thefuck#readme) commandline tool to retry common mistakes (aliased to `retry`)
![retry](https://user-images.githubusercontent.com/7649736/157540204-f6411841-0411-49c8-9175-8bee6302b66e.gif)
- Custom `git` functions authored by @ddhorstman (see documentation by running these commands with `--help`):
  - `gitc` allows you to quickly make a commit with an included message:
  ![gitc](https://user-images.githubusercontent.com/7649736/157537443-d466e66f-ac75-40ac-bfec-904c7d9fb268.gif)
  - `gitb` allows you to navigate branches based on partial matches:
  ![gitb-1](https://user-images.githubusercontent.com/7649736/157537125-4443dd27-fc55-4bb8-8492-2a5c5d7d82b4.gif)
  - and creates branches if no matches are found:
  ![gitb-2](https://user-images.githubusercontent.com/7649736/157537795-b89f86dc-07ae-420c-85b4-b6313d88f2fe.gif)
  - and supports partial-name-matching on deletion (`-D`) and rebase (`-R`) commands:
  ![gitb-3](https://user-images.githubusercontent.com/7649736/157538515-58ad421f-bc1f-4737-9a90-212d6ef54f7e.gif)
  - `gitp` automatically suggests creating a new upstream from your branch if none is found:
  ![gitp](https://user-images.githubusercontent.com/7649736/157538162-f4cd1d25-9972-4066-91ad-9fdb44fa4bd4.gif)
