FROM ruby:2.5.1
ENV LANG C.UTF-8

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs

WORKDIR /myproject

ADD Gemfile /myproject/Gemfile
ADD Gemfile.lock /myproject/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /myproject


