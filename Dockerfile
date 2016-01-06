FROM ruby:2.3
MAINTAINER Scott Jacobsen <jacobsenscott@yahoo.com>

ENV TINI_VERSION v0.8.4
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

ENV MAILCATCHER_VERSION 0.6.1
RUN gem install mailcatcher --version "$MAILCATCHER_VERSION" --no-ri --no-rdoc
CMD ["mailcatcher", "-f", "--ip", "0.0.0.0"]
EXPOSE 1080
EXPOSE 1025
