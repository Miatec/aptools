# Table of Content
- [Linux](#linux)
  * [Bash](#bash)
  * [Network](#network)
  * [Compilation](#compilation)
  * [Misc](#misc)
    + [Qwerty --> azerty](#qwerty-----azerty)
  * [VIM](#vim)
    + [Compare files in vim : `vimdiff file1 fil2`](#compare-files-in-vim----vimdiff-file1-fil2-)
- [Windows](#windows)
  * [And a table of contents](#and-a-table-of-contents)
  * [On the right](#on-the-right)


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

## Compilation
* Get the symbols from a compiled file : `strings`
* Get the libraries needed for an executable : `ldd`

## Misc
* Know the version of the OS : `cat /etc/<os name>`
* Know glibc used by rpmbuild : `rpm -q glibc` 
* Know the list of installed paquets : `yum list installed`
* Know the content of a tar : `tar -tf <file>`
* Allow to mount usb key : `modprobe usb-storage`
* how to demangle function name in GDB : `maint demangle _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc`


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
