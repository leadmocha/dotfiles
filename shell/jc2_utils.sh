###############################################################################
## JC2 useful utilities
export JC2UTILSLOADED="1"

## Source file only if it exists
function sourceIfExists()
{
  if [ -f $1 ];
  then
    source $1
    if [ "$PS1" ]; then
      source "$1"
    else
      source "$i" >/dev/null 2>&1
    fi
  fi
}

###############################################################################
## Cleanly modify paths stored in a variable and separated by colons
pathRemove()
{
  ## Dereference the variable
  var=\$"$1"
  ## Get variable contents
  val=`eval "expr \"${var}\" "`
  ## Now remove the given path from this variable
  eval "$1=`echo -n ${val} | awk -v RS=: -v ORS=: '$0 != "'$2'"' | sed 's/:$//'`"
}
pathAddClean()
{
  ## Dereference the variable
  var=\$"$1"  ## Deferencing the variable
  ## Get variable contents
  val=`eval "expr \"${var}\" "`
  pathRemove $1 $2
  ## Get the variable contents again
  val=`eval "expr \"${var}\" "`

  ## Check to see if it's empty or just a single colon
  if [ -z ${val} ]; # || [ ${val} = "x" ];
  then
    ## Variable is empty, so we can just add the path
    eval "$1=\"$2\""
  else
    ## Variable already has content, so add this path
    #if [ $3 == "prepend" ];
    if [ -z $3 ] || [ $3 = "prepend" ];
    then
      ## Prepend the path
      eval "$1=\"$2:${val}\""
    else
      ## Append the path
      eval "$1=\"${val}:$2\""
    fi
  fi
}

pathPrependClean()
{
  pathAddClean $1 $2 prepend
}

pathAppendClean()
{
  pathAddClean $1 $2 append
}

