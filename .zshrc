#zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/local/bin/platform-tools:/$HOME/go/bin:$HOME/Library/Python/2.7/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/mgee/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="avit"
ZSH_THEME="bira"

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
plugins=(git git-flow)

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

export CODE=~/go/src
export GOPATH=~/go

alias scpprd="cd ${CODE}/github.com/scpprd"

fpath=(/usr/local/share/zsh-completions $fpath)

function completions () {
  source <(kubectl completion zsh)
  source <(minikube completion zsh)
}
# source /Users/mgee/Library/Python/2.7/bin/aws_zsh_completer.sh
export PATH="$(brew --prefix qt)/bin:$PATH"

function kps () {
  configfile=$(ls ~/Downloads/kube-config-*)
  mv $configfile ~/.kube/kpsconfig
  export KUBECONFIG=~/.kube/kpsconfig
  sed -i.bak 's/:443/:9443/' $KUBECONFIG
  kubectl cluster-info
}

sslget () { openssl s_client -showcerts -connect "$@:443" </dev/null; }

fork () {
  git remote rename origin upstream
  git remote add origin $1
}

forkup () {
  git fetch upstream
  git merge upstream/master
}

getwx() {
  station=$1
  curl -fs http://tgftp.nws.noaa.gov/data/observations/metar/stations/$station.TXT
  curl -fs http://tgftp.nws.noaa.gov/data/forecasts/taf/stations/$station.TXT
}

getnotams() {
  station=$1
  curl -fs "https://pilotweb.nas.faa.gov/PilotWeb/notamRetrievalByICAOAction.do?method=displayByICAOs&reportType=RAW&formatType=DOMESTIC&retrieveLocId=${station}&actionType=notamRetrievalByICAOs" | pup '#notamRight pre text{}'
}

pushbranch () {
	$(git push 2>&1 | grep git)
}

lvi () {
	a=("${(@s/:/)1}")
	vi $a[1] +$a[2]
}

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/mgee/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/mgee/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/mgee/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/mgee/node_modules/tabtab/.completions/sls.zsh
export PATH="/usr/local/opt/gpg-agent/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export SCPPRD="$GOPATH/src/github.com/scpprd"
#zprof
