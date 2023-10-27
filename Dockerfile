FROM ruby:2.7.0

RUN apt update
RUN apt upgrade -y
RUN apt install lsb-base lsb-release

#PostgresSQL
#Create the file repository configuration:
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

#Import the repository signing key:
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt update \
    && apt install -y libpq-dev \
                      vim \
                      htop \
                      postgresql-14

RUN gem install pg

ADD . /home/app/web
WORKDIR /home/app/web

RUN bundle install --jobs 5 --retry 5







#   curl \
#   build-essential \
#   libpq-dev &&\
#   curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
#   curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
#   echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
#   apt-get update && apt-get install -y nodejs yarn vim

# RUN mkdir /app
# WORKDIR /app
# COPY Gemfile /app/Gemfile
# COPY Gemfile.lock /app/Gemfile.lock
# COPY package.json /app/package.json
# COPY yarn.lock /app/yarn.lock
# RUN bundle install
# RUN yarn install --check-files
# COPY . /app

# # Add a script to be executed every time the container starts.
# #COPY entrypoint.sh /usr/bin/
# #RUN chmod +x /usr/bin/entrypoint.sh
# #ENTRYPOINT ["entrypoint.sh"]
# EXPOSE 3000

# # Start the main process.
# CMD ["rails", "server", "-b", "0.0.0.0"]