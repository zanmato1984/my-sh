cite about-plugin
about-plugin 'common plugin'

function fp ()
{
  about 'display full path of a file'
  param '1: file name'
  group 'common'
  if [ "${1::1}" == "/" ]; then
    echo $1
  else
    echo $1 | sed "s:^:`pwd`/:"
  fi
}

function clipcpy ()
{
  about 'copy stdin to clipboard'
  group 'common'
  if [ $(uname) = "Darwin" ]; then
    tr -d "\n" | pbcopy
  elif [ $(uname) = "Linux" ]; then
    tr -d "\n" | xsel -b
  fi
}

function clippst ()
{
  about 'paste clipboard to stdout'
  group 'common'
  if [ $(uname) = "Darwin" ]; then
    pbpaste
  elif [ $(uname) = "Linux" ]; then
    xsel -b -o
  fi
}

function selcpy ()
{
  about 'copy stdin to select'
  group 'common'
  if [ $(uname) = "Darwin" ]; then
    tr -d "\n" | pbcopy
  elif [ $(uname) = "Linux" ]; then
    tr -d "\n" | xsel
  fi
}

function selpst ()
{
  about 'paste clipboard to stdout'
  group 'common'
  if [ $(uname) = "Darwin" ]; then
    pbpaste
  elif [ $(uname) = "Linux" ]; then
    xsel -o
  fi
}

function cfp ()
{
  about 'copy full path of a file to clipboard'
  param '1: file name'
  group 'common'
  fp $* | clipcpy
  echo "`clippst` copied to clipboard."
}

function sfp ()
{
  about 'copy full path of a file to select'
  param '1: file name'
  group 'common'
  fp $* | selcpy
  echo "`selpst` copied to select"
}

function pk ()
{
  about 'kill the processes with specified name pattern'
  param '1: process name pattern'
  group 'common'
  for arg in $@
  do
    ps -u $USER | grep $arg | awk '{print $1}' | xargs kill -9
  done
}

function jpk ()
{
  about 'kill the java processes with specified name pattern'
  param '1: java process name pattern'
  group 'common'
  for arg in $@
  do
    jps | grep $arg | awk '{print $1}' | xargs kill -9
  done
}

function proxy ()
{
  about 'export http/https proxy variables'
  group 'common'
  export http_proxy=http://127.0.0.1:1087
  export https_proxy=http://127.0.0.1:1087
}

function unproxy ()
{
  about 'unexport http/https proxy variables'
  group 'common'
  export -n http_proxy
  export -n https_proxy
}

function tmux-my-sh ()
{
  about 'create my-sh tmux session'
  group 'common'
  tmux new-session -d -s my-sh -n my-sh
  tmux send-keys "cd $MY_SH_HOME" "C-m"
  tmux split-window -h
  tmux send-keys "cd $MY_SH_HOME" "C-m"
  tmux select-pane -t 1
  tmux split-window -v
  tmux send-keys "cd $MY_SH_HOME/oh-my-zsh" "C-m"
  tmux select-pane -t 3
  tmux split-window -v
  tmux send-keys "cd $MY_SH_HOME/bash-it" "C-m"
  tmux select-pane -t 1

  tmux new-window -n oh-my-zsh
  tmux send-keys "cd ~/.oh-my-zsh" "C-m"
  tmux split-window -v
  tmux send-keys "cd" "C-m"
  tmux select-pane -t 1

  tmux new-window -n bash-it
  tmux send-keys "cd ~/.bash_it" "C-m"
  tmux split-window -v
  tmux send-keys "cd" "C-m"
  tmux select-pane -t 1

  tmux new-window -n scripts
  tmux send-keys "cd $MY_SH_HOME/scripts" "C-m"

  tmux select-window -t 1
  tmux a -t my-sh
}
