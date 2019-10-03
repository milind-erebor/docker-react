# Multi-stage Dockerfile
FROM node:alpine as builder
WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /usr/app/build /usr/share/nginx/html
# CMD not needed, since ngnix starts by default