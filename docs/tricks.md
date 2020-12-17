[TOC]


# Linux
## Bash
* Create a file with a specific type : `mknode`
* `realpath` ~ `readlink -e`
* How to know the last mounted USB : `ls -lrt /dev/sd* | tail -1`
* Get Current date : `currentDate=$(date +%Y%m%d_%H%M%S)`

## Network
* Listen to a tcp port : `nc -l <port>`
* send data to a tcp port : `echo "data" | nc <ip> <port>`
* Listen to a udp port : `nc -lu <port>`
* send data to a udp port : `echo "data" | nc -u <ip> <port>`
* How to know if a port is in use or not : `lsof -i | grep <port>`


## Misc
* Know the version of the OS : `cat /etc/<os name>`
* Know glibc used by rpmbuild : `rpm -q glibc` 
* Know the list of installed paquets : `yum list installed`
* Know the content of a tar : `tar -tf <file>`
* Allow to mount usb key : `modprobe usb-storage`
### Qwerty --> azerty
* From console : `loadkeys fr`
* From graphic user interface console : `setxkbmap -layout fr`

## VIM
* Exit from a `CTRL + S` : `CTRL + Q`
* Dir diff inside vim : https://github.com/will133/vim-dirdiff
### Compare files in vim : `vimdiff file1 fil2`
* Next diff `]c`
* Previous diff `[c`
* get opposed line `do`
* push to opposed line `dp`

# Windows
... Hope this will remain empty =)
