FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


# /app/build is where everything to put on the server is

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
