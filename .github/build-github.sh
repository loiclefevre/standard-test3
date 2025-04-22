#!/bin/bash

goal="-DdbUser=test_$RUNID -DdbPassword=My_Password_4_Testing -DrunID=$RUNID -DdbHost=$HOST -DdbService=$SERVICE"

function logAndExec() {
  echo 1>&2 "Executing:" "${@}"
  exec "${@}"
}

echo "DIR: `pwd`"
echo $PATH
echo $JAVA_HOME
ls -palrt ./gradle/

logAndExec ./gradlew test ${goal} "${@}" -Plog-test-progress=true --stacktrace
