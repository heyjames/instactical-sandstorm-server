#!/bin/bash

param=$1
var2="start"
date=$( TZ=America/Los_Angeles date +'%Y-%m-%d_%H:%M' )
printf "$date "

# Exit script if no/wrong params are given
if [[ ( -z $param ) || ( ! $param =~ ^(start|stop|restart|forceRestart)$ ) ]]; then
  printf "Correct usage: ./insserver start|stop|restart\n"
  exit 1
fi

function outputCountdown() {
  seconds=$1
  range=$( eval echo {$seconds..1} )
  for i in $range; do
    printf "$i.."
    sleep 1
  done
}

function isServerRunning() {
  # Get processes running from current Ubuntu user and counts any process
  # matching the word "Insurgency"
  numServerInstance=$( ps -u $USER | grep -c Insurgency )

  if [[ $numServerInstance > 0 ]]; then
    return 0
  else
    return 1
  fi
}

function prompt() {
  question=$1

  while true; do
    read -p "$question Proceed? " yn
    case $yn in
      [Yy]*) break;;
      [Nn]*) exit;;
      *) printf "Please answer yes or no. ";;
    esac
  done
}

function forceStop() {
  printf "Failed..Force stopping in.."

  killall screen
  outputCountdown 2

  if $( isServerRunning ); then
    printf "Failed..Process is still running.\n"
  else
    printf "Force stopped.\n"
  fi

  exit
}

function stop() {
  quiet=$1

  # Simulate a ctrl+c command
  screen -X -S "Sand1" stuff "^C"
  outputCountdown 4

  if $( isServerRunning ); then
    forceStop
  else
    [[ -z $quiet ]] && printf "Stopped.\n"
  fi
}

function handleStop() {
  # Probably unecessary since promptIfPlayerOnline() checks
  $( ! isServerRunning ) && { printf "Server is not running*.\n"; exit; }

  # stop "$1"
  quiet=$1

  # Simulate a ctrl+c command
  screen -X -S "Sand1" stuff "^C"
  outputCountdown 4

  if $( isServerRunning ); then
    forceStop
  else
    [[ -z $quiet ]] && printf "Stopped.\n"
  fi
}

function handleStart() {
  quiet=$1

  if $( isServerRunning ); then
    printf "Server is already running.\n"
  else
    copyConfigScripts
    $HOME/$var2
    [[ -z $quiet ]] && printf "Started.\n"
  fi
}

function handleRestart() {
  handleStop "quietly"
  handleStart "quietly"
  printf "Restarted!\n"
}

# Begin program
case $param in
  stop)
    # promptIfPlayerOnline
    handleStop
    exit
    ;;
  start)
    handleStart
    exit
    ;;
  restart)
    # promptIfPlayerOnline
    handleRestart
    exit
    ;;
  forceRestart)
    handleRestart
    exit
    ;;
esac