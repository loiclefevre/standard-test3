#!/bin/bash

goal="-Drdbms=$RDBMS -DdbUser=test_$RUNID -DdbPassword=My_Password_4_Testing -DrunID=$RUNID -DdbHost=$database_host -DdbService=$database_service"

function logAndExec() {
  echo 1>&2 "Executing:" "${@}"
  exec "${@}"
}

logAndExec ./gradlew test ${goal} "${@}" -Plog-test-progress=true --stacktrace
