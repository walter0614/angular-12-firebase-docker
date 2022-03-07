#Primera Etapa
FROM node:14-alpine as build-step

RUN mkdir -p /app

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

RUN npm run build --prod

#Segunda Etapa
FROM nginx:1.17.1-alpine
	#Si estas utilizando otra aplicacion cambia Angular12FirebaseCrudDb por el nombre de tu app
COPY --from=build-step /app/dist/Angular12FirebaseCrudDb /usr/share/nginx/html