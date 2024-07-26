FROM node:22-alpine3.19

WORKDIR  /fly

COPY package.json .

RUN npm install

COPY . /fly

EXPOSE 4200

CMD ["npm", "run","start"]

