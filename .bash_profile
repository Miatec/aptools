#!/bin/bash

if test -r /home/s0068661/.scripts/alexpintools/git-completion.bash
then
	source /home/s0068661/.scripts/alexpintools/git-completion.bash
else
	echo "[ERROR] sourcint git-completion impossible"
fi

if test -r /home/s0068661/.scripts/alexpintools/git-flow-completion.bsh
then
	source /home/s0068661/.scripts/alexpintools/git-flow-completion.bsh
else
	echo "[ERROR] sourcing git-flow-completion impossible"
fi

 # source /home/s0068661/.scripts/alexpintools/git-prompt.sh
# PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
