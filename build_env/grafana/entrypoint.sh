#!/bin/bash
set -e

#host="$1"
#port="$2"

echo "!!!!!!!! Check if DB is available !!!!!!!!"

until nc -vz 127.0.0.1 3307; do
  >&2 echo "MySQL is unavailable - sleeping"
  sleep 1
done

>&2 echo "MYSQL is up - executing command"
/run.sh
exit 0

