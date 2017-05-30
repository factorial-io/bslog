#!/bin/sh

SCRIPT_LOG=./bslog.log
touch $SCRIPT_LOG

function BSLOG() {
  local COLOR_DEBUG='\033[00;34m' # normal blue
  local COLOR_ERROR='\033[01;31m' # bold red
  local COLOR_WARN='\033[00;33m' # normal yellow
  local COLOR_INFO='\033[00;00m' # normal white
  local COLOR_SUCCESS='\033[00;32m' # normal green
  local MESSAGE=$2
  case $1 in
    "DEBUG" ) BSLOG_LOG $COLOR_DEBUG   "DEBUG    " "${MESSAGE}";;
    "ERROR" ) BSLOG_LOG $COLOR_ERROR   "ERROR    " "${MESSAGE}";;
    "WARNING" ) BSLOG_LOG $COLOR_WARN "WARNING  " "${MESSAGE}";;
    "SUCCESS" ) BSLOG_LOG $COLOR_SUCCESS "SUCCESS  " "${MESSAGE}";;
    "INFO") BSLOG_LOG $COLOR_INFO            "INFO     " "${MESSAGE}";;
    *) BSLOG_LOG $COLOR_INFO            "INFO     " "${MESSAGE}";;
  esac
}

function BSLOG_LOG() {
  local RESET='\033[00;00m' # normal white
  local COLOR=$1
  local STATUS=$2
  local MESSAGE=$3
  local timeAndDate=`date`
  echo "${COLOR}${MESSAGE}${RESET}"
  echo "[$timeAndDate] ${STATUS} ${MESSAGE}" >> $SCRIPT_LOG
}

function logdebug() {
  BSLOG "DEBUG" "$1"
}

function logerror() {
  BSLOG "ERROR" "$1"
}

function logwarning() {
  BSLOG "WARNING" "$1"
}

function logsuccess() {
  BSLOG "SUCCESS" "$1"
}

function loginfo() {
  BSLOG "INFO" "$1"
}

function log() {
  BSLOG "INFO" "$1"
}
