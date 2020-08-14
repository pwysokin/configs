# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Docplanner docker-specific configuration
export LOCAL_USER_ID=$(id -u)
export LOCAL_GROUP_ID=$(id -g)
export XDEBUG_HOST=10.254.254.254
# end of docker-specific configuration

export TERM="xterm-256color"
export EDITOR=nano
export LANG=en_US.UTF-8
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

ANTIGEN_AUTOUPDATE_VERBOSE=1

#export PATH="$HOME/.bin:/opt/local/bin:/opt/local/sbin:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="$HOME/.bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.config/composer/vendor/bin:$HOME/scripts:$PATH"

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
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

[[ -e "$HOME/.aliases" ]] && source $HOME/.aliases

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export GOPATH=$HOME/gowork
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export GOROOT=/usr/local/go

export PATH=$PATH:$GOROOT/bin

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
