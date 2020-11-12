# Funcion to format a markdown file
# Output to other file:
# md_format input-file [output-file]
# Output to stdout
# md_format input-file --
# Write back to file:
# md_format input-file
function md_format {
  OUT=`(head -n $(grep -n "^\.\.\.$" $1 | cut -d : -f 1) $1; echo; pandoc -f markdown -t markdown-simple_tables --atx-headers --wrap=auto --columns=120 $1) | cat`
  if [ $# -eq 1 ]
  then
    echo -E $OUT | cat > $1
  elif [ $# -eq 2 ]
  then
    if [ "--" = "$2" ]
    then
      echo -E $OUT
    else
      echo -E $OUT | cat > $2
    fi
  fi
}

# Calculator
# c [calculation]
c() { printf "%s\n" "$*" | bc }
alias c="noglob c" 

#function rmi {
#  docker images | tail -n +2 | while read -r line ; do
#      echo "$line"
#      read -q "var?Do you wish to remove this image?" < /dev/tty
#      echo
#      if [[ "$var" =~ ^[Yy]$ ]]
#      then
#          hash=`echo $line | awk '{print $3}'`
#          docker rmi $hash
#      fi
#  done
#}

