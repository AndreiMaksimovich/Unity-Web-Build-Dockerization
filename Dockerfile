FROM nginx:latest

COPY ./build /usr/share/nginx/html

RUN chown -R nginx:nginx /usr/share/nginx/html

COPY ./nginx/default.conf.template /etc/nginx/templates/default.conf.template