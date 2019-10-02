FROM node:12.7-alpine
WORKDIR /opt/webapp

COPY ./src/package.json .
RUN yarn install

COPY ./src .
RUN yarn run build

CMD ["yarn", "start"]
