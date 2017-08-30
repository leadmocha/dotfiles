###############################################################################
## JC2 useful utilities
export JC2UTILSLOADED="1"

## Source file only if it exists
function sourceIfExists()
{
  if [ -f $1 ];
  then
    #source $1
    if [ "$PS1" ]; then
      source $*
    else
      source $* >/dev/null 2>&1
    fi
  fi
}

###############################################################################
## Cleanly modify paths stored in a variable and separated by colons
pathRemove()
{
  ## Check if a delimiter was specified. Otherwise use the default ":"
  if [ "x$3" == "x" ];
  then
    delim=:
  else
    delim="$3"
  fi
  ## Dereference the variable
  var=\$"$1"
  ## Get variable contents
  val=`eval "expr \"${var}\""`
  ## Now remove the given path from this variable
  eval "$1='`echo -n "${val}" | awk -v RS="${delim}" -v ORS="${delim}" '$0 != "'$2'"' | sed 's/'"${delim}"'$//' | sed 's/^'"${delim}"'//'`'"
}
pathAddClean()
{
  ## Check if a delimiter was specified. Otherwise use the default ":"
  if [ -z "$4" ];
  then
    delim=:
  else
    delim="$4"
  fi
  ## Dereference the variable
  var=\$"$1"  ## Deferencing the variable
  ## Get variable contents
  val=`eval "expr \"${var}\" "`
  pathRemove $1 "$2" "${delim}"
  ## Get the variable contents again
  val=`eval "expr \"${var}\" "`

  ## Check to see if it's empty or just a single colon
  if [[ "${val}x" == "x" || "${val}x" == "${delim}x" ]];
  then
    ## Variable is empty, so we can just add the path
    eval "$1=\"$2\""
  else
    ## Variable already has content, so add this path
    #if [ $3 == "prepend" ];
    if [ -z $3 ] || [ $3 = "prepend" ];
    then
      ## Prepend the path
      eval "$1=\"$2${delim}${val}\""
    else
      ## Append the path
      eval "$1=\"${val}${delim}$2\""
    fi
  fi
}

pathPrependClean()
{
  pathAddClean $1 "$2" "prepend" "$3"
}

pathAppendClean()
{
  pathAddClean $1 "$2" "append" "$3"
}

## Set a default value to a variable if variable empty or undefined
setDefault()
{
  if [[ "x$1" == "x" || "x$2" == "x" ]];
  then
    ## Nothing to do...
    return 2
  fi

  ## Dereference the variable
  var=\$"$1"
  ## Get variable contents
  val=`eval "expr \"${var}\""`
  if [ "x${val}" == "x" ];
  then
    ## Variable is unset, so set to default value
    eval "$1=\"$2\""
  fi
}
