FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ENV APP /app
WORKDIR $APP

COPY Gemfile Gemfile.lock $APP/
RUN gem install bundler --conservative
RUN bundle install --without mysql sqlite3 --jobs 10

COPY . $APP

COPY config/database.yml.template $APP/config/database.yml
COPY config/secrets.yml.template $APP/config/secrets.yml

CMD ["/app/docker-cmd.sh"]
