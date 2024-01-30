FROM node:latest

WORKDIR /app

COPY ../japarun-artifact /app

RUN npm install

RUN chmod 755 /app/entry-point.sh

ENTRYPOINT [ "