function start-mysql ()
{
  local port=${1:-4000}
  if [ $# -gt 0 ]; then
    shift
  fi
  local command="mysql -h 127.0.0.1 -P $port -u root --init-command \"create database if not exists test; use test\" $@"
  if [ "$port" -eq 4000 ]; then
     command="$command --prompt \"tidb> \""
  fi
  eval "$command"
}

function tmux-tiflash ()
{
  tmux new-session -d -s tiflash -n algernon
  tmux send-keys "cd $HOME/dev/algernon" "C-m" # Control
  tmux split-window -h
  tmux send-keys "cd $HOME/dev/algernon" "C-m" # Status
  tmux send-keys "./status.sh" "C-m"
  tmux split-window
  tmux send-keys "cd $HOME/dev/algernon/log" "C-m" # Log 1
  tmux split-window
  tmux send-keys "cd $HOME/dev/algernon/log" "C-m" # Log 2
  tmux select-pane -t 1
  tmux split-window
  tmux send-keys "cd $HOME/dev/algernon" "C-m" # Client
  tmux select-pane -t 1

  tmux new-window -n tiflash
  tmux send-keys "cd $HOME/dev/tiflash" "C-m"

  tmux select-window -t 1
  tmux a -t tiflash
}

function tmux-tidb ()
{
  tmux new-session -d -s tidb -n algernon
  tmux send-keys "cd $HOME/dev/algernon" "C-m" # Control
  tmux split-window -h
  tmux send-keys "cd $HOME/dev/algernon" "C-m" # Status
  tmux send-keys "./status.sh" "C-m"
  tmux split-window
  tmux send-keys "cd $HOME/dev/algernon/log" "C-m" # Log 1
  tmux split-window
  tmux send-keys "cd $HOME/dev/algernon/log" "C-m" # Log 2
  tmux select-pane -t 1
  tmux split-window
  tmux send-keys "cd $HOME/dev/algernon" "C-m" # Client
  tmux select-pane -t 1

  tmux new-window -n tidb 
  tmux send-keys "cd $HOME/dev/tidb" "C-m"

  tmux new-window -n mysql
  tmux send-keys "cd $HOME/dev/mysql-docker-compose" "C-m"

  tmux new-window -n client
  tmux send-keys "cd $HOME/dev/tidb" "C-m" # Client to TiDB
  tmux split-window -h
  tmux send-keys "cd $HOME/dev/mysql-docker-compose" "C-m" # Client to MySQL
  tmux select-pane -t 1

  tmux select-window -t 1
  tmux a -t tidb
}

function tmux-mapd ()
{
  tmux new-session -d -s mapd -n scratch
  tmux send-keys "cd $SCRATCH/workspace" "C-m"
  tmux split-window -h
  tmux send-keys "cd $SCRATCH/workspace" "C-m"
  tmux split-window
  tmux send-keys "cd $SCRATCH/workspace" "C-m"
  tmux select-pane -t 1
  tmux split-window
  tmux send-keys "cd $SCRATCH/workspace" "C-m"
  tmux select-pane -t 1

  tmux new-window -n mapd
  tmux send-keys "cd $HOME/dev/omniscidb" "C-m"

  tmux new-window -n ClickHouse
  tmux send-keys "cd $HOME/dev/ClickHouse" "C-m"

  tmux select-window -t 1
  tmux a -t mapd
}

function tmux-clion-mapd ()
{
  tmux new-session -d -s mapd-clion -n clion
  tmux send-keys "source /usr/local/mapd-deps/mapd-deps.sh" "C-m"
  tmux send-keys "clion" "C-m"
}

function tmux-cudf ()
{
  tmux new-session -d -s cudf -n scratch
  tmux send-keys "cd $HOME/dev/scratch" "C-m"
  tmux split-window
  tmux send-keys "cd $HOME/dev/scratch" "C-m"
  tmux select-pane -t 1

  tmux new-window -n ClickHouse
  tmux send-keys "cd $HOME/dev/ClickHouse" "C-m"

  tmux new-window -n cudf
  tmux send-keys "cd $HOME/dev/cudf" "C-m"

  tmux select-window -t 1
  tmux a -t cudf
}

function tmux-clion-cudf ()
{
  tmux new-session -d -s cudf-clion -n clion
  tmux send-keys "clion" "C-m"
}

function tmux-ara ()
{
  tmux new-session -d -s ara -n ara
  tmux send-keys "cd $HOME/dev/ara" "C-m"
  tmux send-keys "conda activate ara-dev" "C-m"
  tmux split-window
  tmux send-keys "cd $HOME/dev/ara" "C-m"
  tmux send-keys "conda activate ara-dev" "C-m"
  tmux select-pane -t 1

  tmux new-window -n arrow 
  tmux send-keys "cd $HOME/dev/arrow/cpp" "C-m"
  tmux send-keys "conda activate ara-dev" "C-m"
  tmux split-window
  tmux send-keys "cd $HOME/dev/arrow/cpp" "C-m"
  tmux send-keys "conda activate ara-dev" "C-m"
  tmux select-pane -t 1

  tmux select-window -t 1
  tmux a -t ara
}

function tmux-arrow ()
{
  tmux new-session -d -s arrow -n cpp
  tmux send-keys "cd $HOME/dev/arrow/cpp" "C-m"
  tmux send-keys "conda activate ara-dev" "C-m"
  tmux split-window
  tmux send-keys "cd $HOME/dev/arrow/cpp" "C-m"
  tmux send-keys "conda activate ara-dev" "C-m"
  tmux select-pane -t 1

  tmux new-window -n python 
  tmux send-keys "cd $HOME/dev/arrow/cpp" "C-m"
  tmux send-keys "conda activate pyarrow-dev" "C-m"
  tmux split-window
  tmux send-keys "cd $HOME/dev/arrow/python" "C-m"
  tmux send-keys "conda activate pyarrow-dev" "C-m"

  tmux select-window -t 1
  tmux a -t arrow
}

