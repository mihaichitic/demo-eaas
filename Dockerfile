FROM nginx:alpine

ARG WITH_SPACES="n / a"
ARG WITH_SPECIALS="n \"/\" a;&"
ARG WITH_NEW_LINES="n\n/\na"
ARG RSA_PRIVATE

WORKDIR /var/www
RUN mkdir -p "/var/log/nginx"
RUN chmod -R a+w /var/log/nginx


COPY nginx.conf /etc/nginx/nginx.conf
COPY empty /etc/nginx/conf.d/default.conf
# RUN sleep 3600
COPY nginx-default.conf /etc/nginx/sites-available/default.conf
COPY index.html ./index.html

RUN echo "$WITH_SPACES"
RUN echo "$WITH_SPECIALS"
RUN echo -e "$WITH_NEW_LINES"
RUN echo -e "$RSA_PRIVATE" | openssl rsa -check


CMD ["nginx"]
EXPOSE 80

