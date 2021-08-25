# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

PATH="/usr/local/bin:$(getconf PATH)"

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

if [ "$OS" = 'OSX' ]; then
  [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  docker
  asdf
)

source $ZSH/oh-my-zsh.sh

# Example aliases
alias dkps="docker ps"
alias dkpsa="docker ps -a"
alias dkst="docker stats"
alias dkimgs="docker images"
alias vscode-cp-config="cp -R ~/Dev/vscode .vscode"
alias ssh-office="ssh paul@192.168.1.67"
alias ssh-wd="ssh sshd@nas-wd"
alias ssh-seagate="ssh paul@seagate-d2.localdomain"
alias ssh-unifi="ssh pi@unifi-controller"
alias docker_stopall="docker stop $$(docker ps -aq)"

export PATH="/usr/local/sbin:$PATH"
export MC_SKIN=blue
export BAT_THEME="Nord"

if [ "$OS" = 'OSX' ]; then
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
  alias upup="sudo apt update && sudo apt upgrade && audo apt autoremove"

  . $HOME/.asdf/asdf.sh

  # Added by Amplify CLI binary installer
  export PATH="$HOME/.amplify/bin:$PATH"

  # opam configuration
  test -r /Users/paulcarroll/.opam/opam-init/init.zsh && . /Users/paulcarroll/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

  # profile.d z.sh
  . /usr/local/etc/profile.d/z.sh
else 
  alias upup="brew update && brew upgrade"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
