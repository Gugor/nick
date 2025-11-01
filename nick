#!/usr/bin/env bash


alias="$1"
path="$2"
shell="$3"


defaultshell=""
shells=("zsh" "fish" "bash" "sh") # Set the shells you want to check in order: first second etc

# Find a defaultshell that exists in our system from the pool of shells
for sh in ${shells[@]}; do 
  [[ -n $(which $sh 2>/dev/null) ]] && defaultshell=$sh
  [[ -n $defaultshell ]] && break 
done

# If the user didn't specifiy a shell set our defaultshell
[[ -z $shell || -z $(which "$shell" 2>/dev/null) ]] && shell="$defaultshell"


RESET="\033[0m"
PARAM="\033[1;37;40m"
LABEL="\033[1;30;43m"
PRG="\033[1;36m"
LABEL2="\033[1;30;45m"
WHITE="\033[1;37m"
ERROR="\033[1;30;41m"
SUCCESS="\033[1;30;42m"

# Lets check if the alias already exists
shconf=${shell:-$defaultshell}
shconf+="rc"

# If here is set as alias we set alias as the Current Working directory (CWD)
if [[ $alias == 'here' ]]; then
  alias=$(basename $PWD)
fi 

exists=$(grep "alias $alias=" $HOME/.$shconf)

if [[ -n $exists ]]; then 
  printf "$ERROR Error $RESET$PARAM Alias already in use $RESET\n"
  exit 1
fi 

if [ -z "$alias" ]; then
  printf "$LABEL @description $RESET$PARAM $PRG nick $RESET$PARAM helps you to set an alias in the .*rc shell config file.$RESET\n\n"
  printf "$LABEL @params $RESET$PARAM [ alias* ] [ path ] [ shell ] $RESET\n"
  printf "       $WHITE alias $RESET is mandatory $WHITE '*' $RESET \n"
  printf "        if no $WHITE path $RESET or $WHITE shell $RESET $PRG nick $RESET will use current path and current shell. \n"
  printf "        if $WHITE alias $RESET is $PRG'here'$RESET, you will create an alias for this directory\n\n"
  printf "$LABEL2 USAGE: $RESET\n"
  printf "   $WHITE nick [ alias* ] [ path ] [shell] $RESET\n"
  printf "$LABEL2 EXAMPLES: $RESET\n"
  printf "   $WHITE \$- nick here $RESET\n"
  printf "   $WHITE \$- nick awesome-proyect $RESET\n"
  printf "   $WHITE \$- nick awesome-proyect \$PWD $RESET %s\n" " # Same as above"
  printf "   $WHITE \$- nick awesome-proyect $HOME/Documents/awesome-project $RESET\n"
  printf "   $WHITE \$- nick awesome-proyect $HOME/Documents/awesome-project zsh $RESET\n"
  echo ""
  exit 1
fi  



if [[ -n $path && -n $shell ]]; then
  if [[ ! -d $path ]]; then
      printf "$ERROR ERROR: $PARAM $PRG'%s'$RESET$PARAM directory doesn't exists \n $RESET" "$path"
      exit 1
  fi
    
   find=$(which $shell 2>/dev/null)
   if [[ -z $find ]]; then
      printf "$ERROR ERROR: $RESET$PARAM shell not found $RESET\n"
      exit 1
   fi

   shconf=$shell
   shconf+="rc" 
   $(cd $HOME && echo "alias $alias=\"cd $path\"" >> ".$shconf" && source $HOME/.$shconf 2>/dev/null)
   printf "$SUCCESS Success: $RESET$PARAM alias $PRG$alias$RESET$PARAM created for $PRG$path$RESET$PARAM in $WHITE.$shconf $RESET\n"
   exit 0
fi


if [[ -n $path ]]; then
  if [[ ! -d $path ]]; then
      printf "$ERROR ERROR: $PARAM$PRG '%s' $RESET$PARAM directory doesn't exists \n $RESET" "$path"
      exit 1
  fi

   shconf=$defaultshell
   shconf+="rc" 
   $(cd $HOME && echo "alias $alias=\"cd $path\"" >> ".$shconf")
   printf "$SUCCESS Success: $RESET$PARAM alias $PRG$alias$RESET$PARAM created for $PRG$path$RESET$PARAM in $WHITE.$shconf $RESET\n"
   exit 0

fi

shconf=$defaultshell
shconf+="rc" 
echo $PWD
echo "alias $alias=\"cd $PWD \"" >> "$HOME/.$shconf"
printf "$SUCCESS Success: $RESET$PARAM alias $PRG$alias$RESET$PARAM created for $PRG$PWD$RESET$PARAM in $WHITE.$shconf $RESET\n"
exit 0
