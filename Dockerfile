FROM node:8.9.4

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

RUN npm install -g --unsafe-perm pm2-docker ts-node typescript @gapi/cli pm2@2.10.2 jest

COPY package.json package.json

RUN npm install

ENV NODE_ENV=production  

COPY . .

CMD [ "gapi", "start", "--prod", "--docker" ]