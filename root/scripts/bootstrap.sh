#!/bin/sh
set -e

/usr/sbin/nginx -t
/usr/sbin/nginx -g "daemon off;"
