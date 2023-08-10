# REACT 
FROM node:16-slim AS build

WORKDIR /code/frontend
COPY /frontend/package*.json .

RUN npm ci
COPY . /code

EXPOSE 3000

RUN ["npm", "run", "build"]


# DJANGO DEV
FROM python:3.11-slim as development

WORKDIR /code

COPY ./requirements.txt .

RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY . .

EXPOSE 8000


# DJANGO PROD
FROM development as prod

COPY --from=build /code/frontend/build /code/frontend/build‚

ENTRYPOINT ["bash", "/code/docker-entrypoint.sh"]