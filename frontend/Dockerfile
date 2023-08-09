# development stage
# Sets up the development environment for building and running the React app
FROM node:lts AS development

ENV CI=true
ENV PORT=3000

WORKDIR /code

COPY package.json /code/package.json
COPY package-lock.json /code/package-lock.json

# Install project dependencies using cached package-lock
RUN npm ci

COPY . /code

CMD [ "npm", "start" ]

# builder stage
# Creates a production build of the React app
FROM development AS builder

# Run the build script to generate the optimized production build
RUN npm run build

# nginx stage
# Sets up a lightweight NGINX server to serve the built React app
FROM nginx:1.13-alpine

# Copy the built application code from the "builder" stage to NGINX's web root directory
COPY --from=builder /code/build /usr/share/nginx/html
