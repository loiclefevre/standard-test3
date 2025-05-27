#!/bin/bash

goal="-Drdbms=$RDBMS -DdbUser=test_$RUNID -DdbPassword=My_Password_4_Testing -DrunID=$RUNID -DdbHost=$HOST -DdbService=$SERVICE"

function logAndExec() {
  echo 1>&2 "Executing:" "${@}"
  exec "${@}"
}

logAndExec ./gradlew test ${goal} "${@}" -Plog-test-progress=true --stacktrace
