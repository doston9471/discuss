# Dockerfile
# Use ruby image to build our own image
FROM ruby:3.0.3

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential nodejs yarn nano

WORKDIR /myapp

COPY Gemfile ./
COPY Gemfile.lock ./

RUN bundle install
RUN yarn install --check-files

COPY . .

EXPOSE 3000

ENTRYPOINT [ "/bin/bash", "-c" ]

CMD ["rails", "server", "-b", "0.0.0.0"]
