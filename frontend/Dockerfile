FROM node:18-slim

WORKDIR /frontend

COPY . .

RUN npm install

EXPOSE 3000

# CMD ["npm", "run", "build"]
CMD ["npm", "start"]