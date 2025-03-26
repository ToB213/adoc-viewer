FROM nginx:alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY /docs/program-docs/ /usr/share/nginx/html/docs
COPY create-index.sh /usr/local/bin/create-index.sh

RUN chmod +x /usr/local/bin/create-index.sh

# nginx へのアクセスポイント
WORKDIR /usr/share/nginx/html/docs

RUN /usr/local/bin/create-index.sh

EXPOSE 80
