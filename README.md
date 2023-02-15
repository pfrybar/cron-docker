## cron-docker

Simple docker image which can run docker containers on a schedule (cron).

### Description

To get this to work, you must bind mount the docker socket (`/var/run/docker.sock`)
into the container in order to launch other containers on the host.

On startup, the container will look for a crontab file in `/etc/crontab` and
install it if found. Then it will launch the cron daemon and execute your commands.

### Example

Run `date` within an `alpine:3.15` container every minute:
```
echo "* * * * * /usr/bin/docker run --rm alpine:3.15 date" > crontab
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v "$PWD/crontab":/etc/crontab pfrybar/cron-docker
```

Print a local file (on the host) within an `alpine:3.15` container every minute:
```
echo "* * * * * /usr/bin/docker run --rm -v \"$PWD/crontab\":/data/crontab alpine:3.15 cat /data/crontab" > crontab
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v "$PWD/crontab":/etc/crontab pfrybar/cron-docker
```

### Notes

To edit the cron commands, simply make the changes to the mounted `crontab` file and restart the container.
