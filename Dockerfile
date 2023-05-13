FROM ruby:3.2.2-alpine
RUN apk add --update --no-cache \
    build-base \
    postgresql-dev \
    git \
    nodejs \
    yarn \
    tzdata \
    bash
WORKDIR /app
COPY Gemfile* .
RUN bundle install -j4 --retry 3
COPY . .
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]