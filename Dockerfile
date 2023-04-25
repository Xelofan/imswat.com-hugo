FROM httpd:alpine

COPY ./public /app/public/

EXPOSE 80