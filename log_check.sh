#!/bin/bash

log_file="/var/log/my-app.log"

redis_host="localhost"
redis_port="6379"
redis_db="0"

update_redis() {
  file_size=$(stat -c %s "$log_file")
  file_date=$(stat -c %Y "$log_file")

  redis-cli -h "$redis_host" -p "$redis_port" -n "$redis_db" SET "log_file_info" "Size: $file_size, Last Modified: $file_date"
}

if [ "$(stat -c %Y "$log_file")" -ne "$(redis-cli -h "$redis_host" -p "$redis_port" -n "$redis_db" GET "log_file_info" 2>/dev/null)" ]; then
  update_redis
fi
