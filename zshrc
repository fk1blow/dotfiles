# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="arcade"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git cake compleat ai github npm lein node pip screen battery bower coffee colorize command-not-found composer docker django fabric git-extras go golang heroku jake-node knife laravel nvm pip python rake redis-cli screen ssh-agent sublime vagrant debian)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/git-prompt/zshrc.sh

# Customize to your needs...
export PATH=/home/abularca/.rbenv/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/abularca/.gem/ruby/1.8/bin:/opt/nginx/sbin:/home/abularca/.bin:

export TERM="xterm-256color"
alias jake="noglob jake"
alias open='xdg-open "$@" > /dev/null 2> /dev/null'
alias sub='subl $0'
#alias git=hub

PATH=$PATH:$HOME/.manymo/bin # Add manymo to PATH for scripting
PATH=$PATH:$HOME/playground/ubervu/thehole/node_modules/.bin
ZSH=$HOME/.oh-my-zsh

SSH_AUTH_SOCK=`netstat -xl | grep -o '/run/user/1000/keyring-bF5Dq7/ssh'`
[ -z "$SSH_AUTH_SOCK" ] || export SSH_AUTH_SOCK

function aa_power_settings ()
{
  sudo bash -c '
    for i in `find /sys/devices -name "bMaxPower"`;
    do
        for ii in `find $i -type f`;
        do
            bd=`dirname $ii`;
            busnum=`cat $bd/busnum`;
            devnum=`cat $bd/devnum`;
            title=`lsusb -s $busnum:$devnum`;
            echo -e "\n\n+++ $title\n  -$bd\n  -$ii";
            for ff in `find $bd/power -type f ! -empty 2>/dev/null`;
            do
                v=`cat $ff 2>/dev/null|tr -d "\n"`;
                [[ ${#v} -gt 0 ]] && echo -e " `basename $ff`=$v";
                v=;
            done | sort -g;
        done;
    done;
    echo -e "\n\n\n+++ Kernel Modules\n";
    for m in `command lspci -k|sed -n "/in use:/s,^.*: ,,p"|sort -u`;
    do
        echo "+ $m";
        systool -v -m $m 2> /dev/null | sed -n "/Parameters:/,/^$/p";
    done
  ';
}

export CHROME_BIN=chromium-browser
export DART_SDK=/opt/dart-sdk
