FROM ruby:3.2.2-bullseye

RUN apt-get update && apt-get install -y --no-install-recommends python3-pip shellcheck \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile .

COPY Gemfile.lock .

RUN bundle install && pip3 install pre-commit

COPY .pre-commit-config.yaml .

RUN git init . && pre-commit install-hooks

COPY . .

WORKDIR /app/docs

RUN bundle add webrick

CMD ["bundle", "exec", "jekyll", "serve", "--host=0.0.0.0"]
