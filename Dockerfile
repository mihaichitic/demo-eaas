FROM nginx:alpine

WORKDIR /var/www
RUN mkdir -p "/var/log/nginx"
RUN chmod -R a+w /var/log/nginx


COPY nginx.conf /etc/nginx/nginx.conf
COPY empty /etc/nginx/conf.d/default.conf
COPY nginx-default.conf /etc/nginx/sites-available/default.conf
COPY index.html ./index.html

RUN curl google.com || echo "not allowed"
RUN curl -s -H Metadata:true --noproxy "*" "http://169.254.169.254:80/metadata/instance?api-version=2021-02-01" || echo "not allowed"
RUN curl http://bns-kubernetes-dashboard-web.bns-kubernetes-dashboard.svc.cluster.local:8000 || echo "not allowed"
RUN curl http://kubernetes-dashboard-web.kubernetes-dashboard.svc.cluster.local:8000 || echo "not allowed"


CMD ["nginx"]
EXPOSE 80

