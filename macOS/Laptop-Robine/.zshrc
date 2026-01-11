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

# Load Antigen
if [[ $OSTYPE == 'darwin'* ]]; then
  if [ -s /opt/homebrew/share/antigen/antigen.zsh ]; then
    source /opt/homebrew/share/antigen/antigen.zsh
  else
    source /usr/local/share/antigen/antigen.zsh
  fi
elif [[ $OSTYPE == 'linux'* ]]; then
  source /usr/share/zsh-antigen/antigen.zsh
elif [[ $OSTYPE == 'cygwin' ]]; then
  :
fi

# Load Antigen configurations
antigen init ~/.antigenrc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# iTerm2 Shell Integration
[ -e "${HOME}/.iterm2_shell_integration.zsh" ] && source "${HOME}/.iterm2_shell_integration.zsh"

# Load 1Password Plugins
[ -s "~/.config/op/plugins.sh" ] && source ~/.config/op/plugins.sh
