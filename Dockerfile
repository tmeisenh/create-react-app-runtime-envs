# generic image with node and npm
FROM node:current-alpine AS base
WORKDIR /usr/local/app
RUN npm install -g npm@latest

# image with package.json and cached node_modules
# useful for test containers or an express server with prod only modules
FROM base AS npmmodules
COPY *.json ./
RUN npm install

FROM npmmodules as builder
COPY src ./src/
COPY public ./public/
COPY .env ./
RUN npm run build

# release/runtime only container
FROM nginx:alpine
COPY ./inject_envs_and_run.sh /root/inject_envs_and_run.sh

WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=builder /usr/local/app/build .

EXPOSE 80
CMD ["/root/inject_envs_and_run.sh"]
