FROM node:16 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
RUN npm install -g @angular/cli
COPY . .
RUN npm run build --prod

FROM nginx:alpine
#COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist/fly /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
