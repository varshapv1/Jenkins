# this is my base image
FROM nginx:latest
COPY index.html /usr/share/nginx/html/index.html
