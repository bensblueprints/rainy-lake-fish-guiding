FROM nginx:alpine
COPY . /usr/share/nginx/html
RUN rm -rf /usr/share/nginx/html/web-grabber-scrape \
    /usr/share/nginx/html/Dockerfile \
    "/usr/share/nginx/html/Rainy Lake Fish Guiding.md" \
    /usr/share/nginx/html/.git 2>/dev/null || true
EXPOSE 80
