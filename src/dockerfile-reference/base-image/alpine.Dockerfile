FROM alpine

RUN apk add --update nodejs npm

WORKDIR /usr/app

# Separate dependency installation and application copying for better caching
COPY package*.json .
RUN npm i

COPY . .

EXPOSE 8080

ENTRYPOINT [ "node", "./index.js" ]