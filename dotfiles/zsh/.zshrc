# Plugins 
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "esc/conda-zsh-completion"
plug "zsh-users/zsh-completions"

# Config
export PATH=$PATH:/usr/local/bin/mermaid
export PATH="/home/vanhoa/.local/bin:$PATH"
export PATH="/home/vanhoa/.emacs.d/bin:$PATH"
export POLYBAR_CONFIG="~/.config/polybar/config"
export PATH="/home/vanhoa/.config/polybar:$PATH"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# [[PATH TO YOUR OH-MY-ZSH INSTALLATION]]
# export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"    
# source $ZSH/oh-my-zsh.sh

# [[Automatic sourcing]]
source ~/.zshenv

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias emacs="emacsclient -c -a'emacs'"
alias vi="nvim"
alias nv="nvim"

# [[KEYBINDINGS]]
# e = emacs, v = vi
bindkey -e
bindkey "^h" backward-kill-word

# Cargo
export Path="/home/vanhoa/.config/.cargo/bin:$PATH"

# Node
export PATH=$PATH:./node_modules/.bin

#Calcurse
alias cal="calcurse"

# LF
export PATH="/home/vanhoa/.config/go/bin:$PATH"
export EDITOR="nvim" 

