FROM xtremxpert/docker-base:alpine

MAINTAINER XtremXpert <xtremxpert@xtremxpert.com>

COPY keygen.sh /etc/cont-init.d/keygen
RUN chmod 755 /etc/cont-init.d/keygen

RUN apk update && \
	apk upgrade && \
	apk --update add \
		supervisor \
		openssh

RUN mkdir -p /var/run/sshd /var/log/supervisor

COPY supervisord.conf /etc/supervisord.conf

EXPOSE 22

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
