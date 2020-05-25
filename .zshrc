# Docplanner docker-specific configuration
export LOCAL_USER_ID=$(id -u)
export LOCAL_GROUP_ID=$(id -g)
export XDEBUG_HOST=host.docker.internal
# end of docker-specific configuration

export TERM="xterm-256color"
export EDITOR=nano
export LANG=en_US.UTF-8
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

ANTIGEN_AUTOUPDATE_VERBOSE=1

#POWERLEVEL9K_INSTALLATION_PATH=$HOME/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-bhilburn-SLASH-powerlevel9k.git/powerlevel9k.zsh-theme
POWERLEVEL9K_INSTALLATION_PATH=$HOME/.antigen/bundles/bhilburn/powerlevel9k
POWERLEVEL9K_MODE="awesome-patched"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time virtualenv rbenv time)
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_STATUS_VERBOSE=true

# Colors
POWERLEVEL9K_STATUS_OK_BACKGROUND="green"
POWERLEVEL9K_STATUS_OK_FOREGROUND="black"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="red"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="black"
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="249"

#export PATH="$HOME/.bin:/opt/local/bin:/opt/local/sbin:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="$HOME/.bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.config/composer/vendor/bin:$PATH"

autoload -Uz compinit && compinit -i
test -d "${HOME}/.zsh/completion" || mkdir -p "${HOME}/.zsh/completion"
test -e "${HOME}/.zsh/completion/_docker-compose" || curl -L https://raw.githubusercontent.com/docker/compose/1.17.0/contrib/completion/zsh/_docker-compose > "${HOME}/.zsh/completion/_docker-compose"
fpath=(~/.zsh/completion $fpath)
test -f /usr/local/bin/kompose && source <(/usr/local/bin/kompose completion zsh)

source $HOME/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundles <<EOBUNDLES
	unixorn/autoupdate-antigen.zshplugin
	zsh-users/zsh-syntax-highlighting
	zsh-users/zsh-autosuggestions
	command-not-found
	greymd/docker-zsh-completion
	zdharma/history-search-multi-word
#	docker
	git
	git-extras
	git-flow
	httpie
	macports
	brew
	extract
	osx
	node
	npm
	yarn
	screen
	zsh-users/zsh-history-substring-search
	rupa/z
EOBUNDLES

# Load the theme.
# antigen theme agnoster
antigen theme bhilburn/powerlevel9k powerlevel9k

# Tell Antigen that you're done.
antigen apply

[[ -e "$HOME/.aliases" ]] && source $HOME/.aliases

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/pwysokin/go
