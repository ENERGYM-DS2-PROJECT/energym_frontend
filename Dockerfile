FROM node:14.16.1-alpine as base

WORKDIR /app

COPY package*.json ./

RUN npm install --legacy-peer-deps

COPY . ./

RUN npm run build

FROM nginx:1.21

COPY --from=base /app/build /usr/share/nginx/html

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]