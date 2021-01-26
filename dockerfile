FROM node:alpine
WORKDIR '/usr/app'
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build
 
FROM nginx
EXPOSE 8080
COPY --from=0 /usr/app/build /usr/share/nginx/html