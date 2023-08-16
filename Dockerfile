FROM alpine
COPY collectors /collectors
RUN \
	apk --no-cache add python3 bash smartmontools lvm2 py3-prometheus-client && \
	wget -P /collectors https://raw.githubusercontent.com/prometheus-community/node-exporter-textfile-collector-scripts/master/smartmon.py && \
	chmod +x /collectors/* && \
	rm -rf /var/cache/apk/*

COPY collect.sh /entrypoint
ENTRYPOINT ["/entrypoint"]
