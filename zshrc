OS_="Darwin"
if [[ $(uname -s) == "Linux" ]]; then OS_="Linux"; fi

#
# Correctly display UTF-8 with combining characters.
if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
	setopt combiningchars
fi

# disable log
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias tmux="tmux -2"

export GOPATH=$HOME/go
export GODIR=$HOME/gosrc
export GOPROXY=https://goproxy.cn,direct
export GOPRIVATE="github.com/j2gg0s"

if [[ $PATH != *"$GOPATH/bin"* ]]; then export PATH=$PATH:$GOPATH/bin; fi
if [[ $OS_ == "Darwin" ]]; then
  if [[ $PATH != *"/opt/homebrew/bin"* ]]; then export PATH=/opt/homebrew/bin:$PATH; fi
  if [[ $PATH != *"/opt/homebrew/opt/openjdk/bin"* ]]; then export PATH=$PATH:/opt/homebrew/opt/openjdk/bin; fi
  if [[ $PATH != *"/opt/homebrew/opt/mysql-client@5.7/bin"* ]]; then export PATH=$PATH:/opt/homebrew/opt/mysql-client@5.7/bin; fi
  if [[ $PATH != *"/opt/homebrew/opt/llvm/bin"* ]]; then export PATH=$PATH:/opt/homebrew/opt/llvm/bin; fi
  if [[ $PATH != *"/opt/homebrew/opt/binutils/bin"* ]]; then export PATH=$PATH:/opt/homebrew/opt/binutils/bin; fi
  if [[ $PAHT != *"/opt/homebrew/Cellar/x86_64-linux-gnu-binutils/2.41_1/bin"* ]]; then export PATH=$PATH:/opt/homebrew/Cellar/x86_64-linux-gnu-binutils/2.41_1/bin; fi
  if [[ $PAHT != *"/Users/j2gg0s/.local/bin"* ]]; then export PATH=$PATH:/Users/j2gg0s/.local/bin; fi
  if [[ $PATH != *"/opt/homebrew/opt/postgresql"* ]]; then export PATH=$PATH:/opt/homebrew/opt/postgresql@15/bin; fi
  if [[ $PATH != *"/opt/homebrew/opt/openjdk@21/bin"* ]]; then export PATH=$PATH:/opt/homebrew/opt/openjdk@21/bin; fi
  if [[ $PATH != *"/opt/homebrew/opt/mysql@8.4/bin"* ]]; then export PATH=/opt/homebrew/opt/mysql@8.4/bin:$PATH; fi
  export JAVA_HOME="/opt/homebrew/opt/openjdk@21"
fi

# bash completion
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export KUBECONFIG=~/.kube/config.yaml

[[ -e ~/.ssh/.profile ]] && emulate sh -c 'source ~/.ssh/.profile'

# proxy
alias startproxy="export https_proxy=http://localhost:8118;export http_proxy=http://localhost:8118;HTTP_PROXY=http://localhost:8118;HTTPS_PROXY=http://localhost:8118"
alias stopproxy="unset http_proxy && unset https_proxy && unset HTTP_PROXY && unset HTTPS_PROXY"

export http_proxy=http://localhost:8118
export https_proxy=http://localhost:8118
export HTTP_PROXY=http://localhost:8118
export HTTPS_PROXY=http://localhost:8118

# alias
if [[ $OS_ == "Darwin" ]]; then
  export HOMEBREW_NO_AUTO_UPDATE=1
fi

alias k="kubectl"
alias g="git"
alias klogs="kubectl logs"
alias kget="kubectl get"

. $HOME/.vim/rupa_z.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/j2gg0s/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/j2gg0s/miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/j2gg0s/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/j2gg0s/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
CONDA_SOLVER=classic
# <<< conda initialize <<<

export GETH_DATADIR=/Users/j2gg0s/gethdata
export GETH_DATADIR_ANCIENT=/Volumes/jdisk/ancient
export GETH_NETWORKID=1
