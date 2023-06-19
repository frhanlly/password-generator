#!/bin/bash

MAX_SIZE=64
LENGTH=48

while getopts "vl:" OPTION  ; do

	case ${OPTION} in
		v)
			VERBOSITY="true"	
		;;
		l)
			#max size for password is 64 bytes long (1 byte per character);
			if [[ "${OPTARG}" -le ${MAX_SIZE} ]] ; then
				LENGTH=${OPTARG}
			else
				echo "setting size to MAX SIZE (64 characters)..."
			fi
		;;
		:|*)
			exit 1
	esac
done

PASSWORD="$(date +"%s%N" | sha256sum | head -c ${LENGTH})"

echo "Your password: ${PASSWORD}"

