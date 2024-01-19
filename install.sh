if [ $# != 2 ]; then
  echo 'Usage:'
  echo ''
  echo 'install.sh shell domain'
  echo ''
  echo 'shell: could be bash or zsh.'
  echo ''
  echo 'domain: could be goron, gerudo, rito or zora.'
  exit;
fi

SHELL=$1
DOMAIN=$2
if [ $SHELL = "bash" ]; then
  RC="$HOME/.bashrc"
  SHELL_ENV='"$BASH_IT"'
elif [ $SHELL = "zsh" ]; then
  RC="$HOME/.zshrc"
  SHELL_ENV='$ZSH'
fi
if [ $(uname) = "Darwin" ]; then
  NEW_LINE=$'\n'
elif [ $(uname) = "Linux" ]; then
  NEW_LINE='n'
fi
PWD=`pwd`

# Some clean-up ahead.
sed -i -e "/MY_SH/d" $RC
sed -i -e "/my-sh.sh/d" $RC

## Set My-SH envs.
sed -i -e "s,source $SHELL_ENV,export MY_SH_HOME=$PWD\\${NEW_LINE}export MY_SH_SHELL=$SHELL\\${NEW_LINE}export MY_SH_DOMAIN=$DOMAIN\\${NEW_LINE}source $SHELL_ENV," $RC

# Source my-sh.sh which has prerequisites of shell plugins defined in domain.
sed -i -e "s,source $SHELL_ENV,source $PWD/my-sh.sh\\${NEW_LINE}source $SHELL_ENV," $RC

# Alacritty conf.
if [ $(uname) = "Darwin" ]; then
  ALACRITTY_OS_YML='alacritty.darwin.toml'
elif [ $(uname) = "Linux" ]; then
  ALACRITTY_OS_YML='alacritty.linux.toml'
fi
ln -sf $PWD/alacritty/$ALACRITTY_OS_YML $HOME/.alacritty.os.toml
ln -sf $PWD/alacritty/alacritty.toml $HOME/.alacritty.toml

# Input rc.
ln -sf $PWD/input/inputrc $HOME/.inputrc

# Vim rc.
ln -sf $PWD/vim/vimrc $HOME/.vimrc
ln -sf $PWD/vim/vimrc $HOME/.ideavimrc
ln -sf $PWD/vim/vimrc $HOME/.vrapperrc

# Tmux conf.
ln -sf $PWD/tmux/tmux.conf $HOME/.tmux.conf

# SSH conf.
ln -sf $PWD/ssh/$DOMAIN/config $HOME/.ssh/config

# Link shell plugins.
if [ $SHELL = "bash" ]; then
  for f in `ls bash-it/common`; do
    ln -sf $PWD/bash-it/common/$f $BASH_IT/custom/$f
  done
  for f in `ls bash-it/$DOMAIN`; do
    ln -sf $PWD/bash-it/$DOMAIN/$f $BASH_IT/custom/$f
  done
elif [ $SHELL = "zsh" ]; then
  rm -rf $ZSH/custom/plugins/common
  ln -sf $PWD/oh-my-zsh/common $ZSH/custom/plugins/common
  rm -rf $ZSH/custom/plugins/$DOMAIN
  ln -sf $PWD/oh-my-zsh/$DOMAIN $ZSH/custom/plugins/$DOMAIN
fi

# Set theme.
if [ $SHELL = "bash" ]; then
  echo 'Please set bash-it theme manually.'
elif [ $SHELL = "zsh" ]; then
  sed -i -e "s,ZSH_THEME=\".*\",ZSH_THEME=\"random\"," $RC
fi

# Enable plugins.
if [ $SHELL = "bash" ]; then
  echo 'Please enable bash-it plugin manually.'
elif [ $SHELL = "zsh" ]; then
  sed -i -e "s,plugins=(.*),plugins=(aliases brew docker docker-compose git golang mvn common $DOMAIN)," $RC
fi

