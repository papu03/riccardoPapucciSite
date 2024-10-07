# Specifing our base container, in my case the Ruby version 3.1.3 container
FROM ruby:3.1.3 as builder

# Set the current working directory in the container
WORKDIR /usr/src/app

#Copy over our gem files and gemspec files
COPY Gemfile jekyll-theme-chirpy.gemspec ./ 

# Install the required gems
RUN bundle install 

# Copy over everything from our local directory to the container
COPY . . 

# Generate our static site
RUN JEKYLL_ENV=production bundle exec jekyll build 



# Specifing our base container
FROM nginx:latest

COPY _nginx/nginx.conf /etc/nginx

# Copy the generated static files from our Ruby container and placing them in the default nginx directory
COPY --from=builder /usr/src/app/_site /usr/share/nginx/html

# Copia i certificati SSL (assicurati di averli nella directory _nginx/ssl)
COPY _nginx/ssl /etc/nginx/ssl

# Secifing the command that will be run when the container starts, this case running nginix in the foreground.
CMD ["nginx", "-g", "daemon off;"]