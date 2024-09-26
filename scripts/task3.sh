#!/bin/bash

while getopts ":p:s:" opt; do
	case $opt in
		p)
			path="$OPTARG"
			;;
		s)
			search_string="$OPTARG"
			;;
		\?)
		 echo "Invalid option: -$OPTARG" >&2
		 exit 1
	 	 ;;
                :)
		 echo "Option -$OPTARG requires an argument" >&2
		 exit 1
		 ;;
	esac
done

if [ -z "$path" ] || [ -z "$search_string" ]; then
	echo "Usage: $0 -p path -s string"
	exit 1
fi

if [ ! -d "$path" ]; then
	echo "error: directory '$path' not found"
	exit 1
fi

find "$path" -type f -exec grep -l "$search_string" {} +

