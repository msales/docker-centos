#!/bin/sh

export NSS_WRAPPER_PASSWD=/opt/sys/passwd
export NSS_WRAPPER_GROUP=/etc/group
export LD_PRELOAD=/usr/lib64/libnss_wrapper.so