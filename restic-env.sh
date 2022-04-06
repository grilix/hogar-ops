#!/bin/bash

export PS1="\[\e[0;34m\][\[\e[m\]restic env\[\e[0;34m\]]\[\e[m\]:\W\[\e[0;31m\]#\[\e[m\] "

cd /var/lib/autorestic

export $(sudo cat .env | xargs)

sudo -E /usr/bin/bash --norc --noprofile
