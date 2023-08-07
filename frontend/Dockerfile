FROM node:18-slim

WORKDIR /frontend

COPY package.json .

RUN npm install

COPY . .

EXPOSE 3000

ENTRYPOINT ["npm", "run", "build"]