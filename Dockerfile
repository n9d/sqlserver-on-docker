FROM ruby:3.1.0
#RUN apt-get update && apt-get install -y freetds-dev freetds-common freetds-bin
RUN apt-get update && apt-get install -y freetds-dev
WORKDIR /app
RUN bundle init
RUN bundle add tiny_tds
