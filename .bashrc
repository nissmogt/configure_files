# .bashrc

# SOURCE GLOBAL DEFINITIONS
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias la='ls -a'
alias ll='ls -l'
alias l='ls -lcvX'
alias ..='cd ..'
alias ....='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
#alias dnf='sudo dnf'
alias mkdir='mkdir -pv'
alias grep='grep --color=auto'
alias mount='mount | column -t'
alias h='history'

# SSH ALIAS #
alias davinci='ssh -X davinci'
#alias onuchic1='ssh -X onuchic1'
alias nots='ssh -X nots'

######################################### PATHS ######

# MY SCRIPT PATH #
export PATH=$PATH:$HOME/mbin

# MATLAB PATH #
export PATH=$PATH:$HOME/mbin/matlab

# SMOG V2 PATH #
source $HOME/tools/smog203/configure.smog2
export PATH=$PATH:$HOME/tools/smog203/bin

# CURRENT DIRECTORY PATH #
export PATH=$PATH:.

# ANACONDA PATH #
export PATH="$HOME/anaconda2/bin:$PATH"

# PYMOL PATH #
export PATH="$HOME/anaconda2/pymol/:$PATH"

PATH="/home/kmm5/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/kmm5/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/kmm5/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/kmm5/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/kmm5/perl5"; export PERL_MM_OPT;
