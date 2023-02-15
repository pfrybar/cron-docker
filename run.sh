#!/bin/sh

[ -f /etc/crontab ] && /usr/bin/crontab /etc/crontab
exec /usr/sbin/crond -f -d 8
