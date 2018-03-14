cite about-plugin
about-plugin 'goron tools'

function sce ()
{
  about 'copy full path of e.sql to select'
  group 'goron'
  sfp $DEVROOT/inceptor_idea/sql/e.sql
}

function ccf ()
{
  about 'copy full path of a file to clipboard and paste to f.sql'
  param '1: file name'
  group 'goron'
  cfp $*
  echo "source `clippst`" > $DEVROOT/inceptor_idea/sql/f.sql
  echo "`clippst` sourced to $DEVROOT/inceptor_idea/sql/f.sql"
}

function scf ()
{
  about 'copy full path of a file to select and paste to f.sql'
  param '1: file name'
  group 'goron'
  sfp $*
  echo "source `selpst`" > $DEVROOT/inceptor_idea/sql/f.sql
  echo "`selpst` sourced to $DEVROOT/inceptor_idea/sql/f.sql"
}

function warp ()
{
  about 'switch the working warp id'
  param '1: warp number (4 digits)'
  group 'goron'
  export HIVE_BR=$SVN_ROOT/sbranches/ruoxi/warp-$1/hive-0.12.0-transwarp
  export NGMR_BR=$SVN_ROOT/sbranches/ruoxi/warp-$1/ngmr-1.7-transwarp
  export INCEPTOR_BR=$SVN_ROOT/sbranches/ruoxi/warp-$1/inceptor_idea
}

function rlbr ()
{
  about 'switch the working release branch'
  param '1: release branch version (x.x)'
  group 'goron'
  export HIVE_BR=$SVN_ROOT/release_branches/transwarp-$1/hadoop/sources/hive-0.12.0-transwarp
  export NGMR_BR=$SVN_ROOT/release_branches/transwarp-$1/hadoop/sources/ngmr-1.7-transwarp
  export INCEPTOR_BR=$SVN_ROOT/release_branches/transwarp-$1/hadoop/sources/inceptor_idea
}

function devroot ()
{
  about 'switch the working devroot'
  param '1: devroot path'
  group 'goron'
  rm $DEVROOT
  ln -sf $1 $DEVROOT
}

function dsnst ()
{
  about 'De-snapshot the project version'
  group 'goron'
  sed -i "s/-SNAPSHOT//g" `find . -not -type d`
}

function bpvs ()
{
  about 'Bump the project version'
  param '1: base version'
  param '2: target version'
  group 'goron'
  sed -i "s/$1/$2/g" `find . -not -type d -and \( -name "*.java" -or -name "*.xml" -or -name "*.MF" -or -name "*.properties" -or -name "*.product" -or -name "*.sh" -or -name "*.md" \)`
}
