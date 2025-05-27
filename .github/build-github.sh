#!/bin/bash

env

goal="-Drdbms=$RDBMS -DdbUser=test_$RUNID -DdbPassword=My_Password_4_Testing -DrunID=$RUNID -DdbHost=$DATABASE_HOST -DdbService=$DATABASE_SERVICE"

function logAndExec() {
  echo 1>&2 "Executing:" "${@}"
  exec "${@}"
}

logAndExec ./gradlew test ${goal} "${@}" -Plog-test-progress=true --stacktrace
