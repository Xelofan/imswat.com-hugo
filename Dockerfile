# FROM httpd:alpine

# RUN apk add --no-cache curl

# COPY ./public /usr/local/apache2/htdocs

# EXPOSE 80

# HEALTHCHECK --interval=30s --retries=2 --start-period=5s CMD curl --fail http://127.0.0.1:80/ || exit 1

## BUILD
FROM hugomods/hugo:exts as builder

# ARG HUGO_BASEURL=
# ENV HUGO_BASEURL=${HUGO_BASEURL}

COPY . /src
RUN hugo --gc --ignoreCache

## FINAL
FROM hugomods/hugo:nginx
COPY --from=builder /src/public /site