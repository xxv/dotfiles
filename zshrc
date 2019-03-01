########################## Stock zsh stuff ###########################
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Used by agnoster
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
plugins=(django git sudo virtualenv zbell zproject zsh-autosuggestions)

#autoload -U compinit && compinit

zbell_ignore=(ag more less view sudo bash zsh $EDITOR $PAGER man run-help ssh mosh emacs vim ipython ipython3 top gap gc gd gdc glg gst grom units openscad)

zproject_path=$HOME/work/projects

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

######################## my customizations ###########################
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
alias g-o='gnome-open'
alias dictfr='dict -h localhost -d fd-fra-eng'

# git aliases
alias gbr='git branch -vv'
alias gch='git show-ref --head --hash "^HEAD$" 1>&2 | tr -d "\n" | xclip -in'
alias gdc='git diff --cached'
alias gfa='git fetch --all -p'
alias gmfo='git merge --ff-only'
alias gpfo='git pull --ff-only'
alias grom='git rebase -i origin/master'
alias gsur='git submodule update --recursive'
alias glg='git log --stat --max-count=50'
alias glgg='git log --graph --max-count=50'


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

# Android Studio
export STUDIO_JDK=/usr/lib/jvm/java-8-openjdk-amd64/

############################ Project ~/p/ ############################
p() { cd ~/p/$1; }
compctl -g '~/p/*(:s@'$HOME'/p/@@)' p

alias prj=project

######################################################################

tmp() {
    dir="${HOME}/tmp/$(date '+%Y-%m-%d_%H%m%S')"
    mkdir "${dir}" && \
        cd "${dir}"
}

######################################################################

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PERL5LIB=/home/steve/perl5/lib/perl5
export PERL_LOCAL_LIB_ROOT="/home/steve/perl5"
export PERL_MM_OPT=INSTALL_BASE="/home/steve/perl5"
export PERL_MB_OPT="--install_base \"/home/steve/perl5\""

export PATH="$HOME/.local/bin:$PATH"

export KISYS3DMOD=/usr/local/share/kicad/modules/packages3d

# Load in private information
source ~/.zsh_private

# Load in profile paths
source ~/.profile
