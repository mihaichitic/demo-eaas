FROM nginx:alpine

ARG WITH_SPACES="n / a"
ARG WITH_SPECIALS="n \"/\" a;&"
ARG WITH_NEW_LINES"n\n/\na"

WORKDIR /var/www
RUN mkdir -p "/var/log/nginx"
RUN chmod -R a+w /var/log/nginx


COPY nginx.conf /etc/nginx/nginx.conf
COPY empty /etc/nginx/conf.d/default.conf
# RUN sleep 3600
COPY nginx-default.conf /etc/nginx/sites-available/default.conf
COPY index.html ./index.html

RUN echo $WITH_SPACES
RUN echo $WITH_SPECIALS
RUN echo $WITH_NEW_LINES


CMD ["nginx"]
EXPOSE 80

