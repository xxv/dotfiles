########################## Stock zsh stuff ###########################
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="agnoster"

# Used by agnoster
DEFAULT_USER=steve

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git sudo virtualenv zbell zproject zsh-autosuggestions)

# don't ding on these long-running processes
zbell_ignore=(ag more less view sudo bash zsh $EDITOR $PAGER man run-help ssh mosh emacs vim ipython ipython3 top gap gc gd gdc glg gst grom units openscad)

zproject_path=$HOME/work/projects
alias prj=project

source $ZSH/oh-my-zsh.sh

# zsh options
setopt dvorak correct extended_glob
# really, who wants this‽
unsetopt correct_all

# My env preferences
export EMAIL='steve@staticfree.info'
export EDITOR=vim
export LESS='-j4 -R -i'

# aliases
alias l='ls -lAhB'
alias ll='ls -lah'
alias lt='ls -lAhBtr'
alias open='xdg-open'
alias dictfr='dict -h localhost -d fd-fra-eng'

# git aliases
alias gbr='git branch -vv'
alias gch='git show-ref --head --hash "^HEAD$" 1>&2 | tr -d "\n" | xclip -in'
alias gdc='git diff --cached'
alias gfa='git fetch --all -p'
alias gmfo='git merge --ff-only'
alias gpfo='git pull --ff-only'
alias grhp='git reset HEAD -p'
alias grom='git rebase -i origin/master'
alias gsur='git submodule update --recursive'
alias glg='git log --stat --max-count=50'
alias glgg='git log --graph --max-count=50'
alias grl='git reflog --relative-date'
unalias gl

# git annex
alias gx='git annex'
alias gxl='git annex list'
alias gxli='git annex list --in'
alias gxlih='git annex list --in here'

# Thanks, Debian
alias node=nodejs

# various
alias exif_strip='exiftool -all='
alias ag='ag --pager=less --hidden --ignore .git/'

# reverse-date-sort all file listings
zstyle ':completion:*' file-sort date-reverse

############################ Project ~/p/ ############################

p() { cd ~/p/$1; }
compctl -g '~/p/*(:s@'$HOME'/p/@@)' p

############# easily create a scratch directory ######################

tmp() {
    dir="${HOME}/tmp/$(date '+%Y-%m-%d_%H%m%S')"
    mkdir "${dir}" && \
        cd "${dir}"
}

# Load in private information
source ~/.zsh_private

# Load in profile paths
source ~/.profile
