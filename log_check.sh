#!/bin/bash

log_file="/var/log/my-app.log"

redis_key="my_app_info"

file_size=$(stat -c %s "$log_file")
file_date=$(stat -c %Y "$log_file")

if command -v redis-cli &> /dev/null; then
	redis-cli SET "$redis_key" "{\"size\": $file_size, \"date\": $file_date}"
	echo "Info successfully written into redis"
else
	echo "Error"
fi
