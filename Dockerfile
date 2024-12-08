FROM alpine:3.14

RUN apk add --no-cache \
    nginx \
    nginx-mod-rtmp \
    openssl \
    ffmpeg \
    supervisor

COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /opt/data/hls /opt/data/keys /var/log/nginx

RUN chown -R nginx:nginx /opt/data /var/log/nginx

RUN nginx -t

EXPOSE 1935 8080

CMD ["nginx", "-g", "daemon off;"] 