#!/bin/bash 

if [ -f /root/.ssh/id_rsa ] ; then
    eval "$(ssh-agent -s)"
    ssh-add -k /root/.ssh/id_rsa
fi

if [ "${ENVKEY}x" == "x" ]; then
    exec bash
else
    eval $(envkey-source) && exec bash
fi

