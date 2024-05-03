# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"

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
if which brew &> /dev/null; then
  # Coreutils
  if [ -d "$(brew --prefix)/opt/coreutils/libexec/gnubin" ]; then
    export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
  fi
  # cURL
  if [ -d "$(brew --prefix)/opt/curl/bin" ]; then
    export PATH="$(brew --prefix)/opt/curl/bin:$PATH"
  fi
  # OpenSSL
  if [ -d "$(brew --prefix)/opt/openssl@3/bin" ]; then
    export PATH="$(brew --prefix)/opt/openssl@3/bin:$PATH"
  fi
  # Make
  if [ -d "$(brew --prefix)/opt/make/libexec/gnubin" ]; then
    export PATH="$(brew --prefix)/opt/make/libexec/gnubin:$PATH"
  fi
  # Python
  if [ -d "$(brew --prefix)/opt/python/libexec/bin" ]; then
    export PATH="$(brew --prefix)/opt/python/libexec/bin:$PATH"
  fi
fi
# Composer
if which composer &> /dev/null; then
  export PATH="$(composer global config bin-dir --absolute --quiet):$PATH"
fi
# Android
if [ -d "$HOME/Library/Android/sdk" ]; then
  export PATH="$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools:$PATH"
fi
# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# rust
if [ -d "$HOME/.cargo" ]; then
  . "$HOME/.cargo/env"
fi
# ruby (rbenv)
if which rbenv &> /dev/null; then
  eval "$(rbenv init - zsh)"
fi
# Python (pyenv)
if which pyenv &> /dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi
PATH=~/.console-ninja/.bin:$PATH

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Load SSH Keys
#ssh-add --apple-use-keychain ~/.ssh/id_rsa
#ssh-add --apple-load-keychain ~/.ssh/id_rsa
#ssh-add --apple-use-keychain ~/.ssh/id_ed25519
#ssh-add --apple-load-keychain ~/.ssh/id_ed25519

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

# Load 1Password Plugins
source ~/.config/op/plugins.sh

#export PATH="$HOME/.basher/bin:$PATH"   ##basher5ea843
#eval "$(basher init - zsh)"             ##basher5ea843

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# shell completion for iwf command line tool
if [ -z "$INTELLIJ_ENVIRONMENT_READER" ]; then
  autoload -Uz compinit && compinit
  eval "$(_IWF_COMPLETE=zsh_source iwf)"
fi

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"

# Created by `pipx` on 2024-04-30 09:54:46
export PATH="$PATH:/Users/manuele/.local/bin"
