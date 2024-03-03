FROM ruby:3.2.2

RUN apt-get update && apt-get install -y build-essential

RUN gem install bundler

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs

WORKDIR /app

COPY . .

RUN bundle install

RUN npm install --global yarn

CMD ["rails", "server", "-b", "0.0.0.0"]
#CMD ["bin/dev"]
