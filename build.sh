#!/usr/bin/bash

meson --prefix $PWD/_install _build

if [[ "$?" -ne "0" ]]
then
    return 1
fi

ninja -C _build all install

if [[ "$?" -ne "0" ]]
then
    return 1
fi

XDG_DATA_DIRS=_install/share:$XDG_DATA_DIRS ./_install/bin/simple-scan

