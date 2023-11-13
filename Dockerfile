# This file is intended to be used apart from the containing source code tree.

FROM python:3-alpine

# Version of Radicale (e.g. v3)
ARG VERSION=master
EXPOSE 5232
# Run Radicale
CMD ["radicale"]

RUN apk add --no-cache ca-certificates openssl git \
 && apk add --no-cache --virtual .build-deps gcc libffi-dev musl-dev \
 && pip install --no-cache-dir "Radicale[bcrypt] @ https://github.com/Kozea/Radicale/archive/${VERSION}.tar.gz" \
 && apk del .build-deps
