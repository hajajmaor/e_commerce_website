FROM node:lts-alpine AS builder

# LABEL name="node-learning"
ENV PORT=3000 APP_DIR=/app
COPY . ${APP_DIR}
WORKDIR ${APP_DIR}

# EXPOSE ${PORT}

RUN npm install
RUN npm run build



FROM node:lts-alpine AS final
ENV PORT=3000 APP_DIR=/app

COPY --from=builder /app/dist  /app/dist

WORKDIR ${APP_DIR}
ADD package.json .
# ADD package-lock.json .
RUN npm install --only=prod


# HEALTHCHECK --interval=15s --timeout=10s --retries=3 CMD curl -f http://localhost:${PORT}/health || exit 1

EXPOSE ${PORT}


CMD ["npm","run","start"]