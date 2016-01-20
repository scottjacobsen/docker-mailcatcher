FROM phusion/passenger-ruby22:0.9.18
MAINTAINER Scott Jacobsen <jacobsenscott@yahoo.com>

ENV MAILCATCHER_VERSION 0.6.1
RUN apt-get update && \
apt-get upgrade -y && \
gem update --system && \
gem install mailcatcher --version "$MAILCATCHER_VERSION" --no-ri --no-rdoc && \
rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/service/mailcatcher/
COPY mailcatcher.sh /etc/service/mailcatcher/run
ENTRYPOINT ["/sbin/my_init", "--"]
EXPOSE 1080
EXPOSE 1025
