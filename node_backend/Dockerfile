FROM node:lts-alpine AS builder
ENV PORT=3000 APP_DIR=/app
COPY . ${APP_DIR}
WORKDIR ${APP_DIR}

RUN npm install
RUN npm run build

FROM node:lts-alpine AS final
ENV PORT=3000 APP_DIR=/app
ENV NODE_ENV=production
COPY --from=builder /app/dist  /app/dist

WORKDIR ${APP_DIR}
ADD package.json .
RUN npm install --only=prod

EXPOSE ${PORT}

CMD ["npm","run","start"]