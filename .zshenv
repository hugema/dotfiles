# .zshenv : sourced on all invocations of the shell (unless -f option is set)

case `uname` in
Linux)
	export TERM=linux
esac

export TERM=xterm

export HOSTNAME="`/bin/cat /etc/hostname`"
export PATH=$PATH:/sbin/:/usr/sbin/:/usr/local/sbin/
export LD_LIBRARY_PATH="/lib/:/lib/install/:/usr/lib/:/usr/X11R6/lib/:/usr/local/lib"
export INPUTRC="/etc/inputrc"
export RSYNC_RSH="ssh"
export SDL_NOMOUSE=1
export VISUAL="vim"
export BLOCKSIZE=k
export I_WANT_A_BROKEN_PS=yes	# ProcPS version > 1.2.7
export GIT_PAGER="cat"
export CORE_NUMBER=`grep -c processor /proc/cpuinfo`
export LS_OPTIONS="--color=tty"
export PAGER="less"
export EDITOR="vim"

if [ -x /usr/bin/dircolors -a -r /etc/DIR_COLORS ]
then
  eval `dircolors /etc/DIR_COLORS`
fi
if [ -x /usr/bin/dircolors -a -r ~/.dir_colors ]
then
  eval `dircolors ~/.dir_colors`
fi

if [ -x /usr/bin/ack-grep ]
then
  alias gr='ack-grep'
else
  alias gr='grep'
fi

alias ls='/bin/ls $LS_OPTIONS'
alias ll='ls -l'
alias la='ls -la'
alias l='ls'
alias c='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'
alias c..='cd ..'
alias c...='cd ../..'
alias c....='cd ../../..'
alias c.....='cd ../../../..'
alias c......='cd ../../../../..'
alias cd/='cd /'
alias cd~='cd ~'

alias cp='cp -i'
alias mv='mv -i'
alias dh='du -sh'
alias cl='clear'
alias cdc='cd; clear'
alias ps='ps auxwww'
alias df='df -Th'
alias md='mkdir $*'
alias rd='rmdir $*'
alias unix2dos='recode lat1..ibmpc'
alias dos2unix='recode ibmpc..lat1'
alias which='type -p'
alias pdf='evince --fullscreen $*'
alias gq='geeqie $*'
alias mx='host -t mx $*'
alias x='startx'
alias mu='mutt'
alias v='vim $*'
alias vi='vim $*'
alias vd='vimdiff $*'
alias wg='wget -t 0'
alias sc='screen $*'
alias sr='screen -r $*'
alias sx='screen -x $*'
alias sl='screen -ls'
alias s='ssh $*'
alias sshv='ssh -vvv -o LogLevel=DEBUG3 $*'
alias more='less $*'
alias unp='unp -U $*'
alias g='git $*'
alias gexport='git checkout-index -a -f --prefix=$*'
alias va='vagrant'
alias debup='sudo apt-get update'
alias debug='sudo apt-get upgrade && sudo apt-get dist-upgrade'
alias debi='sudo apt-get install $*'
alias debs='apt-cache search $*'
alias debsh='apt-cache show $*'
alias debpurge='sudo apt-get purge $*'
alias debclean='sudo apt-get clean && deborphan | xargs -i sudo dpkg --purge {}'
alias be='bundle exec $*'
alias rs='rails s'
alias rg='rails g $*'
alias pas='padrino start $*'
alias sho='shotgun $*'

if [ -x /usr/bin/lftp ]
then
	alias ftp='lftp'
fi

alias tf='tail -f'
alias ff='find . -name "\!*" -print'
alias kclean='sudo make-kpkg clean'
alias kmake='sudo make-kpkg --append-to-version=.$(date +%Y%m%d%k%M%S) --revision=+$1 kernel_image modules_image'

alias chmodfiles='find $* -type f -exec chmod 644 {} \;'
alias chmoddir='find $* -type d -exec chmod 755 {} \;'
function ss {
	rename 'y/ /_/' * 2> /dev/null
	rename "y/\'/_/" * 2> /dev/null
}
function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }

limit coredumpsize 0
umask 022

if [ -e $HOME/.zsh-$HOSTNAME ]
then
  source $HOME/.zsh-$HOSTNAME
fi
