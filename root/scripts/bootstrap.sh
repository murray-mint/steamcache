#!/bin/sh
set -e

mkdir -p /data/logs

/usr/sbin/nginx -t
/usr/sbin/nginx -g "daemon off;"
