FROM node:16-alpine as builder
LABEL authors="Vojislav Stanojevikj"

WORKDIR /usr/app

COPY ./package.json ./
RUN npm install

COPY ./ ./
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /usr/app/build /usr/share/nginx/html