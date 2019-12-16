#!/bin/sh

CDIR=/collectors

if [ -d "${CDIR}" ]; then
	for cscript in ${CDIR}/*;
	do
		if [ -x ${cscript} ];
		then
			${cscript}
		fi
	done
fi
