# Dockerfile for Rails backend

FROM ruby:3.3.0

WORKDIR /app

# Install system dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn

# Install Rails
RUN gem install rails -v '7.1.3'

# Set environment variables
ENV RAILS_ENV=development

# Install and cache app dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Create config directory and copy credentials
COPY ./config/credentials.yml.enc config/

# Copy master.key
COPY ./config/master.key config/

# Set read-only permissions for master.key during build
RUN chown root:root ./config/master.key && chmod 400 ./config/master.key

# Copy the application code into the container
COPY . .

# Expose port 3000
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
