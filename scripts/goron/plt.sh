#!/bin/bash

if [ $# = 0 ]; then
  echo 'Usage:'
  echo ''
  echo 'plt.sh dialect [test]...'
  echo ''
  echo 'dialect: could be oracle or db2.'
  echo ''
  echo 'test: optional tests, if not specified, means all tests.'
  exit;
fi

DIALECT=$1
PL_TEST_ROOT=$DEVROOT/$HIVEROOT/src/sqlUnitTest/pl/$DIALECT

if [ $# = 1 ];then
  TEST_DIRS=`cat $PL_TEST_ROOT/test_list.txt`
else
  TEMP=($@)
  TEST_DIRS=${TEMP[@]:1}
fi
echo "Test dirs are:"
echo $TEST_DIRS

for dir in ${TEST_DIRS[@]}; do
  $PL_TEST_ROOT/pl_test.sh $PL_TEST_ROOT/$dir
done
