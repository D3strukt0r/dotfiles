# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi

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
fi

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# iTerm2 Shell Integration
[ -e "${HOME}/.iterm2_shell_integration.zsh" ] && source "${HOME}/.iterm2_shell_integration.zsh"

# Load 1Password Plugins
[ -s "~/.config/op/plugins.sh" ] && source ~/.config/op/plugins.sh

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Created by `pipx` on 2024-04-30 09:54:46
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$PATH:$HOME/.local/bin"
fi

