OS_="Darwin"
if [[ $(uname -s) == "Linux" ]]; then OS_="Linux"; fi

#
# Correctly display UTF-8 with combining characters.
if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
	setopt combiningchars
fi

disable log
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Path to your oh-my-zsh installation.
export ZSH=/Users/j2gg0s/.oh-my-zsh

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
export GOBIN=$HOME/go/bin
export GODIR=$HOME/go/src/github.com/golang/go
export GOPROXY=https://goproxy.cn,direct
export GOPRIVATE="github.com/echoingtech,g.echo.tech,github.com/j2gg0s"

if [[ $PATH != *"$GOPATH/bin"* ]]; then export PATH=$PATH:$GOPATH/bin; fi
if [[ $PATH != *"/usr/local/opt/libpq/bin/"* ]]; then export PATH=$PATH:/usr/local/opt/libpq/bin/; fi
if [[ _OS == "Darwin" ]]; then
  if [[ $PATH != *"/opt/homebrew/bin"* ]]; then export PATH=$PATH:/opt/homebrew/bin; fi
  if [[ $PATH != *"/opt/homebrew/opt/openjdk/bin"* ]]; then export PATH=/opt/homebrew/opt/openjdk/bin:$PATH; fi
  if [[ $PATH != *"/opt/homebrew/opt/mysql-client@5.7/bin"* ]]; then export PATH=$PATH:/opt/homebrew/opt/mysql-client@5.7/bin; fi
fi


# bash completion
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export KUBECONFIG=~/.kube/config.yaml

[[ -e ~/.ssh/.profile ]] && emulate sh -c 'source ~/.ssh/.profile'

# proxy
if [[ -e /.dockerenv ]]; then
  alias startproxy="export https_proxy=http://host.docker.internal:8118;export http_proxy=http://host.docker.internal:8118"
  alias stopproxy="unset http_proxy && unset https_proxy"

  export http_proxy=http://host.docker.internal:8118
  export https_proxy=http://host.docker.internal:8118
else
  alias startproxy="export https_proxy=http://127.0.0.1:8118;export http_proxy=http://127.0.0.1:8118"
  alias stopproxy="unset http_proxy && unset https_proxy"

  export http_proxy=http://127.0.0.1:8118
  export https_proxy=http://127.0.0.1:8118
fi

# alias
if [[ _OS == "Darwin" ]]; then
  alias ctags="`brew --prefix`/bin/ctags"
  export HOMEBREW_NO_AUTO_UPDATE=1
fi

alias k="kubectl"
alias g="git"
alias klogs="kubectl logs"
alias kget="kubectl get"

. $HOME/.vim/rupa_z.sh
