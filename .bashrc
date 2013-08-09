# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias ls="ls -h --color=auto"

# User specific environment and startup programs:
export LANG=en_US.UTF-8

export TERM=rxvt-unicode

# colorful multi lines bash prompt ----------
Color_Off='\e[0m' # Text Reset

# Regular Colors
Black='\e[0;30m' # Black
Red='\e[0;31m' # Red
Green='\e[0;32m' # Green
Yellow='\e[0;33m' # Yellow
Blue='\e[0;34m' # Blue
Purple='\e[0;35m' # Purple
Cyan='\e[0;36m' # Cyan
White='\e[0;37m' # White

# Bold
BBlack='\e[1;30m' # Black
BRed='\e[1;31m' # Red
BGreen='\e[1;32m' # Green
BYellow='\e[1;33m' # Yellow
BBlue='\e[1;34m' # Blue
BPurple='\e[1;35m' # Purple
BCyan='\e[1;36m' # Cyan
BWhite='\e[1;37m' # White

# High Intensity
IBlack='\e[0;90m' # Black
IRed='\e[0;91m' # Red
IGreen='\e[0;92m' # Green
IYellow='\e[0;93m' # Yellow
IBlue='\e[0;94m' # Blue
IPurple='\e[0;95m' # Purple
ICyan='\e[0;96m' # Cyan
IWhite='\e[0;97m' # White

function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# notes:
# if use color, then PS1 should be PS1="\[$COLOR\]", otherwise wrap will go wrong
# the basic multi lines should be PS1="\342\224\214\342\224\200\n\342\224\224\342\224\200\342\224\200>"

# multi line color
sq_color="\[$IBlue\]"

# xx files yy totle
DIR_INFO="\[$ICyan\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files\[$IYellow\] \$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')"

LINE1="\[$sq_color\][$DIR_INFO\[$sq_color\]]-\[$Red\]\$(parse_git_branch)\[$sq_color\][\[$IGreen\]\w\[$sq_color\]]"

LINE2="\[$IWhite\]\u\[$White\]@\[$IWhite\]\h\[$BBlue\] $ \[$Color_Off\]"

PS1="\n$sq_color\342\224\214\342\224\200$LINE1\n$sq_color\342\224\224\342\224\200\342\224\200>$LINE2"

#- -----------------------------------
