#!/bin/bash -e
. .env
(
  COUNTER=0
  while [  $COUNTER -lt 120 ]; do
    echo "## Periodic Travis logging keep-alive. The counter is $COUNTER"
    let COUNTER=COUNTER+1
    sleep 60
  done
  echo "Timing out after 120 minutes."
) &
KEEPALIVE_PID=$!

docker build -t ${TRAVIS_REPO_SLUG}:latest .

if ps -p $KEEPALIVE_PID > /dev/null
then
   kill $KEEPALIVE_PID
fi
