FROM node:alpine

RUN mkdir -p /usr/src/app
RUN mkdir -p /usr/src/app/node_modules && chown -R node:node /usr/src/app
WORKDIR /usr/src/app

EXPOSE 3000
RUN apk add --update tini

COPY package.json package.json

USER node
RUN npm install
COPY --chown=node:node  . .

CMD [ "/sbin/tini", "--", "node", "." ]
