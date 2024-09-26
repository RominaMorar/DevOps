#!/bin/bash

while getopts ":p:e:" opt; do
	case $opt in
		p)
			path="$OPTARG"
			;;
		e)
			extension="$OPTARG"
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

if [ -z "$path" ] || [ -z "$extension" ]; then
	echo "Usage: $0 -p path -e extension"
	exit 1
fi

if [ ! -d "$path" ]; then
	echo "error: directory '$path' not found"
	exit 1
fi

count=$(find "$path" -type f -name "*.$extension" | wc -l)
echo "Number of files with extension .$extension in $path: $count"


