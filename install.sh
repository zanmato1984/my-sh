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
elif [ $SHELL = "zsh" ]; then
  RC="$HOME/.zshrc"
fi
PWD=`pwd`

# Some clean-up ahead.
sed -i -e "/MY_SH/d" $RC
sed -i -e "/my-sh.sh/d" $RC

# Set My-SH envs.
sed -i -e "s,source,export MY_SH_SHELL=$SHELL\nexport MY_SH_DOMAIN=$DOMAIN\nsource," $RC

# Source my-sh.sh which has prerequisites of shell plugins defined in domain.
sed -i -e "s,source,source $PWD/my-sh.sh\nsource," $RC

# Input rc.
ln -sf $PWD/input/inputrc $HOME/.inputrc

# Vim rc.
ln -sf $PWD/vim/vimrc $HOME/.vimrc
ln -sf $PWD/vim/vimrc $HOME/.ideavimrc
ln -sf $PWD/vim/vimrc $HOME/.vrapperrc

# Tmux conf.
ln -sf $PWD/tmux/tmux.conf $HOME/.tmux.conf

# Shell plugins.
if [ $SHELL = "bash" ]; then
  for f in `ls bash-it/common`; do
    ln -sf $PWD/bash-it/common/$f $BASH_IT/custom/$f
  done
  for f in `ls bash-it/$DOMAIN`; do
    ln -sf $PWD/bash-it/$DOMAIN/$f $BASH_IT/custom/$f
  done
elif [ $SHELL = "zsh" ]; then
  for f in `ls oh-my-zsh/common`; do
    ln -sf $PWD/oh-my-zsh/common/$f $ZSH/custom/plugins/$f
  done
  for f in `ls oh-my-zsh/$DOMAIN`; do
    ln -sf $PWD/oh-my-zsh/$DOMAIN/$f $ZSH/custom/plugins/$f
  done
fi
