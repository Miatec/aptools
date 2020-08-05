#! /bin/bash

APTOOLS_HOME=~/.aptools/
if [ -z ${APTOOLS_LOADED+x} ]
then 

    export APTOOLS_LOADED="TRUE"
  
    alias ls='ls --color'
    alias ll='ls -la'
    alias env='env | sort'
    alias bashrc='source ~/.bashrc'
    alias printenvpretty='$APTOOLS_HOME/print_env.bsh'
  
    # export proxyAdr=internet.corp.thales
    # export proxyPort=8080
    # export proxyUser=S068661
  
    #export http_proxy="http://$proxyUser@$proxyUser:$proxyPort"
    #export https_proxy="https://$proxyUser@$proxyUser:$proxyPort"
    #export ftp_proxy="ftp://$proxyUser@$proxyUser:$proxyPort"
  
  
    export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
    export LESS=' -R '
    export MYVIMRC=$APTOOLS_HOME/.vimrc 
  
    function setTabTitle() {
      if [[ -z "$ORIG" ]]; then
        ORIG=$PS1
      fi
      TITLE="\[\e]2;$*\a\]"
      PS1=${ORIG}${TITLE}
    }
  
  
    # always display ls -l for result for find.
    function llfind()	
    {
  	  find $@ -exec ls -l {} \;
    }
  
  
    # time sorted find
    function tsfind()
    {
  	  find . -iname $@ -printf "%T@ %Tc %u:%g %m %p %l\n" \
  		  | sort -n \
  		  | cut -d' ' -f1 --complement
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
  
  
    # this function rename a file by its own name with the suffix '_${date_hour}.archiva'
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
  
  
    function tarzfoldernow()
    {
  	  local folder=$1
  	  local folderName=$(basename $folder)
  	  local now=$(date +%Y%m%d_%H%M%S)
  	  local archivaName=${folderName}_${now}.tgz
  	  tar -czf $archivaName $folder
  	  local tarRes=$?
  	  if [[ "$tarRes" == "0" ]]
  	  then 
  		  echo "[SUCCESS] $folder compressed in $archivaName"
  	  else
  		  echo "[ FAIL  ] compression of $folder failed"
  	  fi
  
  	  return $tarRes
    }
  
    function hisgrep(){
  	  history | grep $@
    }

   function timestamp2date()
   {
   	 perl -le 'print scalar localtime $ARGV[0]' $@
   }
  
    # Set history of bash to an unlimited size
    HISTSIZE= 
    HISTFILESIZE=
   
    function tgz()
   {
	   folder=$1

	   if test ! -d $folder
	   then
		   echo "$folder n'est pas un dossier"
		   return -1
	   fi

	   archivaName=$1.tgz

	   tar -czf $archivaName $folder
	   tarRes=$?

          if [[ "$tarRes" == "0" ]]
          then
                  echo "[SUCCESS] $folder compressed in $archivaName"
          else
                  echo "[ FAIL  ] compression of $folder failed"
		  return -2
          fi


	  return 0
   }

   function untgz()
   {
	   archiva=$1
           if test ! -f $archiva
           then
                   echo "$archiva n'existe pas"
                   return -1
           fi


	   tar -xzf $archiva

          if [[ "$tarRes" == "0" ]]
          then
		  echo "[SUCCESS] $archiva  uncompressed in $(pwd)"
          else
                  echo "[ FAIL  ] uncompression of $archiva failed"
                  return -2
          fi


          return 0


   }



    alias bashrc='source ~/.bashrc'
    alias cd..='cd ..'
    alias cd...='cd ../..'
    alias gti='git' # because I do way too much this mistake
else 
  echo "aptools already activated"
  
fi
