FROM alpine
RUN \
	apk --no-cache add python3 bash smartmontools lvm2 && \
	rm -rf /var/cache/apk/*

COPY collectors /collectors
COPY collect.sh /entrypoint
ENTRYPOINT ["/entrypoint"]
