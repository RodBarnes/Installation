#!/usr/bin/env bash

LANG=en_US.UTF-8
TZ=America/Los_Angeles

sudo update-locale LANG=$LANG
sudo timedatectl set-timezone $TZ
