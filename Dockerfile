FROM ruby:3

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client && gem install bundler rails

ENV APP_HOME /rails-api-restful
RUN mkdir $APP_HOME/
WORKDIR $APP_HOME/
COPY Gemfile Gemfile.lock $APP_HOME/
RUN bundle install
ADD . $APP_HOME

CMD ["/bin/bash"]
