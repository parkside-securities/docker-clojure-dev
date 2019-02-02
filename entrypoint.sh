#!/bin/bash 

if [ -f /root/.ssh/id_rsa ] ; then
    eval "$(ssh-agent -s)"
    ssh-add -k /root/.ssh/id_rsa
fi

eval $(envkey-source) && exec bash
