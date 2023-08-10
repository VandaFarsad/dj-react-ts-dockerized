# REACT 
FROM node:16-slim AS build

WORKDIR /code/frontend
COPY /frontend/package*.json .

RUN echo $(ls -l)
RUN echo $(pwd)
RUN npm ci
COPY . /code

EXPOSE 3000

RUN ["npm", "run", "build"]


# DJANGO
FROM python:3.11-slim

WORKDIR /code

COPY ./requirements.txt .

RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY . .

COPY --from=build /code/frontend/build /code/frontend/build

EXPOSE 8000

ENTRYPOINT ["bash", "/code/docker-entrypoint.sh"]