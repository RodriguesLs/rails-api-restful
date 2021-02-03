FROM ruby:2.6.6.

RUN apt-get install -qq && apt-get install nodejs postgresql-client && gem install bundler rails

ENV APP_HOME /rails-api-restful
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile Gemfile.lock $APP_HOME
RUN bundle install
ADD . $APP_HOME

CMD ["/bin/bash"]
