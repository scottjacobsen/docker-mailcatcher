FROM ruby:2.2
MAINTAINER Scott Jacobsen <jacobsenscott@yahoo.com>
ENV MAILCATCHER_VERSION 0.6.1
RUN gem install mailcatcher --version "$MAILCATCHER_VERSION" --no-ri --no-rdoc
CMD ["mailcatcher", "-f", "--ip", "0.0.0.0"]
EXPOSE 1080
EXPOSE 1025
