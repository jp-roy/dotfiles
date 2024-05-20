# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
COMPLETION_WAITING_DOTS="true"
plugins=(git rails gitfast asdf last-working-dir common-aliases sublime history-substring-search zsh-syntax-highlighting zsh-autosuggestions z)

source $ZSH/oh-my-zsh.sh

[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export BUNDLER_EDITOR="vim"
export EDITOR="vim"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore -u --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="./bin:./node_modules/.bin:/usr/local/bin:${PATH}"

# Disable warning about insecure completion-dependent directories
ZSH_DISABLE_COMPFIX=true

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach -t tmux || tmux new -s tmux
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
