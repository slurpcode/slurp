FROM ruby:3.2.2-bullseye

RUN apt-get update && apt-get -y install python3-pip shellcheck

WORKDIR /app

COPY Gemfile Gemfile

COPY Gemfile.lock Gemfile.lock

RUN bundle install

RUN pip3 install pre-commit

COPY .pre-commit-config.yaml .

RUN git init . && pre-commit install-hooks

COPY . .

WORKDIR /app/docs

RUN bundle add webrick

CMD ["bundle", "exec", "jekyll", "serve", "--host=0.0.0.0"]
