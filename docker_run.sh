#!/bin/bash
if [[ $# > 1 ]]; then
    docker run --detach --rm --init --cap-add=SYS_PTRACE -p "0.0.0.0:$2:$2" --name "$1" -it "kathy/$1"
else
    echo Specify module and port!
fi
