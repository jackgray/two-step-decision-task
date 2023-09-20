# Pull base image.
FROM ruby:2.7 as build

# Update RubyGems
RUN gem update --system
# Install Jekyll and bundler
RUN gem install jekyll bundler

# Set working directory in the container to /app
WORKDIR /app

# Copy over your application code
COPY ./app/ /app/

# Copy over the Gemfile and Gemfile.lock
# COPY Gemfile Gemfile.lock ./

# Install bundle
RUN bundle install

# Build the site on the Jekyll server
RUN bundle exec jekyll build

# Run stage
FROM nginx:alpine
COPY --from=build /app/_site /usr/share/nginx/html
COPY ./app/nginx.conf /etc/nginx/nginx.conf
COPY ./app/nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 4042
EXPOSE 4042

# Run the server
CMD ["nginx", "-g", "daemon off;";]
