FROM xtremxpert/docker-base:ubuntu

MAINTAINER XtremXpert <xtremxpert@xtremxpert.com>

RUN apt-get update && apt-get install -y openssh-server supervisor
RUN mkdir -p /var/run/sshd /var/log/supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22
CMD ["/usr/bin/supervisord"]
