FROM ruby:3.2.2

RUN apt-get update && apt-get install -y build-essential

RUN gem install bundler

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs

WORKDIR /app

COPY . .

RUN bundle install

ARG BUN_VERSION=1.0.15

WORKDIR /build

# Install Bun in the specified version
RUN apt update && apt install -y bash curl unzip && \
 curl https://bun.sh/install | bash -s -- bun-v${BUN_VERSION}

ENV PATH="${PATH}:/root/.bun/bin"

COPY . .

RUN bun install
RUN bun run build

RUN bundle exec rails assets:precompile --quiet

