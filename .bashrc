echo "Setting aliases..."
alias ls='ls --color'
alias ll='ls -la'
alias mgenesis="/home/s0068661/local/florako-clean/sharewood/genesis/python/genesis.py"

#echo "Sourcing dev env..."
#source /freeware/SETUP.SH
echo "You may want to source /freeware/SETUP.SH"

echo "Updating JAVA_HOME  GRADLE_HOME, PATH, M2_HOME and O2_HOME"
export JAVA_HOME=/freeware/linux/opt/jdk1.8.0_181
export PATH=$JAVA_HOME/bin:$GRADLE_HOME:$PATH:/home/s0068661/.scripts/
export O2_HOME=/home/s0068661/local/SP_GMR/sp_bb/../../O2/current/o2_linux64

export M2_HOME="/home/s0068661/local/Software/apache-maven-3.6.1"
export GENESIS_HOME="/home/s0068661/local/sharewood/genesis/python"
export PATH=/local/public/API/Software/firefox/:$M2_HOME/bin:$PATH

export RF_FREQUENCY_STEP=6_000_000
export MEDIAN_RF_FREQUENCY=2_900_000_000

# echo "Setting Proxy"

# export proxyAdr=internet.corp.thales
# export proxyPort=8080
# export proxyUser=S068661

#export http_proxy="http://$proxyUser@$proxyUser:$proxyPort"
#export https_proxy="https://$proxyUser@$proxyUser:$proxyPort"
#export ftp_proxy="ftp://$proxyUser@$proxyUser:$proxyPort"


export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '


function setTabTitle() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}


export GATEWAY_HOSTNAME=d520236.airsystems.thales
export GATEWAY_SSH_TUNNELING_PORT=4242
export BACKEND_IP=220.2.10.187
function setTunnel()
{
	echo "Tunnel de $GATEWAY_HOSTNAME:$GATEWAY_SSH_TUNNELING_PORT vers 220.2.10.187:22 : "
	if [ `ssh $GATEWAY_HOSTNAME ps -aef | grep "ssh -f -L 0.0.0.0:$GATEWAY_SSH_TUNNELING_PORT:220.2.10.187:22" | wc -l ` -eq 0 ]
	then # do it only once
		ssh $GATEWAY_HOSTNAME ssh -f -L 0.0.0.0:$GATEWAY_SSH_TUNNELING_PORT:$BACKEND_IP:22  $GATEWAY_HOSTNAME -N
		res=$?
		
		echo "Tunnel de $GATEWAY_HOSTNAME:$GATEWAY_SSH_TUNNELING_PORT vers $BACKEND_IP:22 : Etablissement = $res" 
	else 
		echo "tunnel de $GATEWAY_HOSTNAME:$GATEWAY_SSH_TUNNELING_PORT vers $BACKEND_IP:22 déjà établi"
	fi
}



alias sshpasserelle="ssh $GATEWAY_HOSTNAME -X"
alias sshbackend="ssh sf500@$BACKEND_IP -X"



function cdgr()
{
	source /home/s0068661/.scripts/cd_git_repository.bsh > /dev/null
}

function meld_()
{
	# Putain de bug de merde!!!!
	# https://bugzilla.redhat.com/show_bug.cgi?id=1117812
	export LANG=en_US.utf8
	meld "$@"
}

function crassersi()
{
	ssh 10.97.58.19
}

function llfind()
{
	find $@ -exec ls -l {} \;
}

function logfind()
{
	fileRes=$(mktemp --suffix __find_results)
	fileErr=$(mktemp --suffix __find_errors)
	find $@ > $fileRes 2> $fileErr
	resFind=$?

	nbRes=$(wc -l < $fileRes)
	nbErr=$(wc -l < $fileErr)
	echo "'find $@' returned : "
	echo "$nbRes results in $fileRes"
	echo "$nbErr Errors in $fileErr"
	echo "find return errorcode is $resFind"
	return $resFind	
}


function vgrep()
{
	grep -v $@
}


function mvdate()
{
	fileToRemove=$1
	fullpath=$(realpath $fileToRemove)
	pathdir=$(dirname $fileToRemove)
	filename=$(basename $fullpath)
	now=$(date +%Y%m%d_%H%M%S)
	newPathName=$pathdir/${filename}_${now}.archiva
	mv $fileToRemove $newPathName
	echo $fileToRemove archived in $newPathName
}


alias bashrc='source ~/.bashrc'

#function vlgrep()
#{
#	res=$(vgrep $1)
#	for arg in "$@"
#	do
#		echo "removing $arg"
#		res=$(echo $res | vgrep $arg)
#	done
#	echo $res
#}


#xhost +
