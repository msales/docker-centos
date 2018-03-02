#!/bin/sh

set -eo pipefail

[[ "$USER_ID" ]] || USER_ID=$(id -u)

if [ $USER_ID -ne 0 ] ; then
	export USER_ID=$(id -u)
	export GROUP_ID=$(id -g)
	export NSS_WRAPPER_PASSWD=/opt/sys/passwd
	export NSS_WRAPPER_GROUP=/etc/group
	
	cat /etc/passwd > /opt/sys/passwd
	echo "${USER_NAME}:x:${USER_ID}:${GROUP_ID}::${USER_HOME}:/sbin/nologin" >> /opt/sys/passwd

	export LD_PRELOAD=/usr/lib64/libnss_wrapper.so
    export HOME=$USER_HOME

fi

eval exec "$@"
