RESET="\033[0m"
PARAM="\033[1;37;40m"
LABEL="\033[1;30;43m"
PRG="\033[1;36m"
LABEL2="\033[1;30;45m"
WHITE="\033[1;37m"
ERROR="\033[1;30;41m"
SUCCESS="\033[1;30;42m"
GREEN="\033[1;30;42m"
set -e 

unistall=""
defaultInstPath="$HOME/.local/bin"
shconf=$(basename $SHELL)
shconf+="rc"

# checking if nick is already installed
if [[ -n $(which $HOME/.local/bin/nick 2>/dev/null) ]]; then
  printf "$LABEL WARNING: $RESET$LABEL2 nick already exists $RESET\n"
  read -p "[?] Do you want to unistall it? (Y/N) " -n1 unistall

  if [[ "$unistall" != "y" && "$unistall" != "Y" ]]; then
    printf "\n\n$GREEN [+] $RESET$LABEL nick is yet to live one more day... $RESET$PARAM \\\\_(ô ô)_// $RESET\n"
    exit 1 
  fi

  printf "\n\n$ERROR [X] $RESET$PARAM Finding nick... $RESET\n"
  delted=$(rm -v $(which $HOME/.local/bin/nick 2>/dev/null))
  printf "$LABEL[!] $PARAM Removing export from $PRG$shconf $RESET\n"
  pattern="# nick path"
  grep -vF "$pattern" "$HOME/.$shconf" > "$HOME/.$shconf.tmp" && mv "$HOME/.$shconf.tmp" "$HOME/.$shconf"
  printf "$ERROR[x] $RESET$PARAM [_[N]_] nick has being removed from this world... \\_( x x)_// \n"
  exit 0
fi

printf "$SUCCESS [+] $PARAM Installing nick... $RESET \n"
cp -v nick.sh nick
cppath=$(mv -v nick $defaultInstPath/nick)
printf "$SUCCESS [+] $PARAM$PRG nick $RESET$PARAM installed in $PRG%s $RESET\n" ${defaultInstPath}
chmod u+x "$defaultInstPath/nick" 
printf "$SUCCESS [+] $PARAM Execution persmissions granted $RESET \n"
if [[ ":$PATH:" != *":$defaultInstPath:"* ]]; then
  echo "export PATH=\"$defaultInstPath:$PATH\" # nick path" >> $HOME/.$shconf
  printf "$SUCCESS [+] $PARAM Adding executable to path... $PRG%s $RESET\n" "$HOME/.$shconf"
  printf "$WARNING [!] $PARAM Update changes, run now: $RESET\n"
  echo "    source $HOME/.$shconf"
else
  printf "$LABEL2[!] $PARAM Path already installed $RESET\n"
fi 


