unsetopt share_history

alias tmux='tmux -2' 
alias tls='tmux ls' 
alias tat='tmux a -t' 
alias tns='tmux new-session -s'
alias icv='iconv -f gbk -t utf-8'

function fp ()
{
  if [ $(uname) = "Darwin" ]; then
    greadlink -f $1
  elif [ $(uname) = "Linux" ]; then
    readlink -f $1
  fi
}

function clipcpy ()
{
  if [ $(uname) = "Darwin" ]; then
    tr -d "\n" | pbcopy
  elif [ $(uname) = "Linux" ]; then
    tr -d "\n" | xsel -b
  fi
}

function clippst ()
{
  if [ $(uname) = "Darwin" ]; then
    pbpaste
  elif [ $(uname) = "Linux" ]; then
    xsel -b -o
  fi
}

function selcpy ()
{
  if [ $(uname) = "Darwin" ]; then
    tr -d "\n" | pbcopy
  elif [ $(uname) = "Linux" ]; then
    tr -d "\n" | xsel
  fi
}

function selpst ()
{
  if [ $(uname) = "Darwin" ]; then
    pbpaste
  elif [ $(uname) = "Linux" ]; then
    xsel -o
  fi
}

function cfp ()
{
  fp $* | clipcpy
  echo "`clippst` copied to clipboard."
}

function sfp ()
{
  fp $* | selcpy
  echo "`selpst` copied to select"
}

function pk ()
{
  for arg in $@
  do
    ps -u $USER | grep $arg | awk '{print $1}' | xargs kill -9
  done
}

function jpk ()
{
  for arg in $@
  do
    jps | grep $arg | awk '{print $1}' | xargs kill -9
  done
}

function proxy ()
{
  export http_proxy=http://127.0.0.1:1087
  export https_proxy=http://127.0.0.1:1087
}

function unproxy ()
{
  unset http_proxy
  unset https_proxy
}
