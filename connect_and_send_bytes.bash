#!/bin/bash

BT_ADDR='10:78:60:00:15:98'
SERVICE_HANDLE='0b000b'

RED="${1}"
GREEN="${2}"
BLUE="${3}"

BYTES="56${RED}${GREEN}${BLUE}00f0aa"
gatttool --device='10:78:60:00:15:98' --handle='0x000b' --char-write-req --value="${BYTES}"
