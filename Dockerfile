FROM alpine:latest
MAINTAINER SteamCache.Net Team <team@steamcache.net>

COPY root/ /

RUN	mkdir -m 755 -p /data/cache /data/logs ;\
	chown -R nginx:nginx /data/            ;\
	mkdir -m 755 -p /tmp/nginx/            ;\
	mkdir -p /etc/nginx/sites-enabled      ;\
	ln -s ../sites-available /etc/nginx/sites-enabled

VOLUME [ "/data" ]

EXPOSE 80

WORKDIR /scripts

ENTRYPOINT [ "/scripts/bootstrap.sh" ]
