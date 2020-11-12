FROM ruby:latest

#RUN apt remove cmdtest
#RUN apt remove yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
# Install alpine packages
RUN apt-get install -qq -y --no-install-recommends \
  busybox \
  ca-certificates \
  cmake \
  curl \
  tzdata \
  gnupg1 \
  graphicsmagick \
  libffi-dev \
  libsodium-dev \
  nodejs \
  yarn \
  openssh-client \
  netcat

# Define WORKDIR
WORKDIR /var/www/app

# Use bunlder to avoid exit with code 1 bugs while doing integration test
RUN gem install bundler -v 2 --no-doc
RUN gem install libv8

# Copy dependency manifest
COPY Gemfile Gemfile.lock /var/www/app/

# Install Ruby dependencies
RUN bundle update --bundler
RUN bundle install --jobs $(nproc) --retry 3

# Copy JavaScript dependencies
COPY package.json yarn.lock /var/www/app/

# Install JavaScript dependencies
RUN yarn --version
RUN yarn install

# Copy source code
COPY . /var/www/app/

#RUN mkdir /var/www/app/tmp
#RUN mkdir /var/www/app/tmp/pids
