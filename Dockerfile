## Build Phase
FROM node:alpine AS builder

WORKDIR '/app/'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Run Phase
FROM nginx

COPY --from=builder /app/dist/ /usr/share/nginx/html






