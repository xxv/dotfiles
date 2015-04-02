# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

DEFAULT_USER=steve

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(ant django git sudo virtualenv zbell)

zbell_ignore=(more less view sudo bash zsh $EDITOR $PAGER man run-help ssh mosh emacs vim ipython top glg gdc gst grom)

source $ZSH/oh-my-zsh.sh

export PATH=/home/steve/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

# my customizations below
#
# zsh options
setopt dvorak correct extended_glob
# really, who wants this‽
unsetopt correct_all

# some variables
export EMAIL='steve@staticfree.info'
export EDITOR=vim
export LESS='-j4 -R -i'
export GREP_OPTIONS='--color=auto'

# aliases
alias l='ls -lAhB'
alias ll='ls -lah'
alias g-o='gnome-open'
alias dictfr='dict -h localhost -d fd-fra-eng'

# git aliases
alias gbr='git branch -vv'
alias gdc='git diff --cached'
alias gfa='git fetch --all -p'
alias gmfo='git merge --ff-only'
alias gpfo='git pull --ff-only'
alias grom='git rebase -i origin/master'
alias gsur='git submodule update --recursive'

# git annex
alias gx='git annex'
alias gxl='git annex list'
alias gxli='git annex list --in'
alias gxlih='git annex list --in here'

alias node=nodejs

# various

alias exif_strip='exiftool -all='

############################## Java ##################################
# work-around for a bug in Java and how it interplays with Awesome:
export AWT_TOOLKIT=MToolkit
#
# sadly, the sun JVM is much faster
# export JAVA_HOME=/usr/lib/jvm/j2sdk1.6-oracle/
# ... and also much older. Gotta ditch it.
export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-amd64/

# Makes java stuff work with Awesome. See bug #508650.
export _JAVA_AWT_WM_NONREPARENTING=true
#
############################## Android ###############################

export ANDROID_HOME=~/android/sdk/
export PATH=$PATH:$HOME/android/sdk/platform-tools:$HOME/android/sdk/tools

############################ Project ~/p/ ############################
p() { cd ~/p/$1; }
compctl -g '~/p/*(:s@'$HOME'/p/@@)' p

project() { cd ~/work/projects/$1; }
compctl -g '~/work/projects/*(:s@'$HOME'/work/projects/@@)' project
alias prj=project
######################################################################

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PERL5LIB=/home/steve/perl5/lib/perl5
export PERL_LOCAL_LIB_ROOT="/home/steve/perl5"
export PERL_MM_OPT=INSTALL_BASE="/home/steve/perl5"
export PERL_MB_OPT="--install_base \"/home/steve/perl5\""

# Load in private information
source ~/.zsh_private
