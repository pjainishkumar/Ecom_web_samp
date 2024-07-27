# Use the official Ruby image
FROM ruby:3.2.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs sqlite3

# Set the working directory
WORKDIR /myapp

# Install bundler and gems
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler:2.4.14 && bundle install

# Copy the rest of the application code
COPY . /myapp

# Precompile assets
RUN bundle exec rake assets:precompile

# Expose port 3000 for the Rails server
EXPOSE 3000

# Set the command to run the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
