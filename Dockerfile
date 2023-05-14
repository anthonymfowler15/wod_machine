FROM ruby:3.2.2-alpine
RUN apk add --update --no-cache \
    build-base \
    postgresql-dev \
    git \
    nodejs \
    yarn \
    tzdata \
    bash \
    npm
WORKDIR /app
COPY . .
RUN bundle install -j4 --retry 3
RUN npm install
EXPOSE 3000
# CMD ["rails", "server", "-b", "0.0.0.0"]