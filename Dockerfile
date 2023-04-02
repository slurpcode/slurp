FROM ruby:3.2.2-bullseye

WORKDIR /app

COPY Gemfile Gemfile

RUN bundle install

COPY . .

WORKDIR /app/docs

RUN bundle add webrick

CMD ["bundle", "exec", "jekyll", "serve", "--host=0.0.0.0"]
