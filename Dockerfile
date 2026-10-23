FROM nginx:alpine

# Copy toàn bộ file vào thư mục web
COPY . /usr/share/nginx/html

# Config nginx để serve đúng MIME type cho mp3
RUN echo 'server { \
    listen 80; \
    root /usr/share/nginx/html; \
    index love.html; \
    location / { \
        try_files $uri $uri/ /love.html; \
    } \
    types { \
        text/html html; \
        text/css css; \
        application/javascript js; \
        image/jpeg jpg jpeg; \
        image/png png; \
        audio/mpeg mp3; \
    } \
}' > /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
