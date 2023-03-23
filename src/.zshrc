# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:$PATH"

# Node Version Manager (nvm)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# Coreutils
export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
# OpenSSL
export PATH="$(brew --prefix)/opt/openssl@3/bin:$PATH"
# Make
export PATH="$(brew --prefix)/opt/make/libexec/gnubin:$PATH"
# Python
export PATH="$(brew --prefix)/opt/python/libexec/bin:$PATH"
# Flutter
#export PATH="$HOME/Library/flutter/bin:$PATH"
# Android
#export PATH="$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools:$PATH"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Load SSH Keys
#ssh-add --apple-use-keychain ~/.ssh/id_rsa
#ssh-add --apple-load-keychain ~/.ssh/id_rsa
#ssh-add --apple-use-keychain ~/.ssh/id_ed25519
#ssh-add --apple-load-keychain ~/.ssh/id_ed25519

# Some alias for work
# swarm-ssh reactbp-dev_fpm
# swarm-ssh reactbp-dev_web sh
swarm-ssh() {
    docker pull iwfwebsolutions/iwf-docker-cli >/dev/null 2>&1
    docker run -it --rm -v $HOME/.ssh:/root/.ssh -v $(pwd):/exports iwfwebsolutions/iwf-docker-cli swarm-ssh.sh $*
}
# swarm-dbdump reactbp-dev
swarm-dbdump() {
    docker pull iwfwebsolutions/iwf-docker-cli >/dev/null 2>&1
    docker run -it --rm -v $HOME/.ssh:/root/.ssh -v $(pwd):/exports iwfwebsolutions/iwf-docker-cli swarm-dbdump.sh $*
}
# swarm-worker test-worker-1
swarm-worker() {
    docker pull iwfwebsolutions/iwf-docker-cli >/dev/null 2>&1
    docker run -it --rm -v $HOME/.ssh:/root/.ssh iwfwebsolutions/iwf-docker-cli ssh iwfsupport@$1.web-solutions.io
}
# swarm-scp test-worker-1 /data1/reactbp-dev/data/
swarm-scp() {
    docker pull iwfwebsolutions/iwf-docker-cli >/dev/null 2>&1
    docker run -it --rm -v $HOME/.ssh:/root/.ssh -v $(pwd):/exports iwfwebsolutions/iwf-docker-cli scp -rp iwfsupport@$1.web-solutions.io:$2 /exports
}
# swarm-copy reactbp-dev_fpm /app/config/services.yaml
# swarm-copy reactbp-dev_fpm /app/public/media
swarm-copy() {
    docker pull iwfwebsolutions/iwf-docker-cli >/dev/null 2>&1
    docker run -it --rm -v $HOME/.ssh:/root/.ssh -v $(pwd):/exports iwfwebsolutions/iwf-docker-cli swarm-copy.sh $*
}

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    #export EDITOR='code'
    export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Load Antigen
if [[ $OSTYPE == 'darwin'* ]]; then
    source /usr/local/share/antigen/antigen.zsh
elif [[ $OSTYPE == 'linux'* ]]; then
    source /usr/share/zsh-antigen/antigen.zsh
elif [[ $OSTYPE == 'cygwin' ]]; then
    :
fi

# Enable option stacking when using e.g. "docker run -it <TAB>"
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# Use DDG in "frontend-search"
FRONTEND_SEARCH_FALLBACK='duckduckgo'

# Define project paths for 'pj'
PROJECT_PATHS=(~/Projects ~/Projects-IWF)

# Load Antigen configurations
antigen init ~/.antigenrc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#source /Users/manuele/.config/op/plugins.sh
#export PATH="$HOME/.basher/bin:$PATH"   ##basher5ea843
#eval "$(basher init - zsh)"             ##basher5ea843

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
