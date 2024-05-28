FROM nginx:1.23-alpine

# RUN rm /etc/nginx/conf.d/default.conf
COPY _nginx/nginx.conf /etc/nginx

ADD _site /var/www/html

