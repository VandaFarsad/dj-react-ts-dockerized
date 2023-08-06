FROM python:3.11-slim

WORKDIR /code


# install dependencies

COPY ./requirements.txt .

RUN pip install --no-cache-dir --upgrade -r requirements.txt


# copy the scripts to the folder

COPY . .

EXPOSE 8000

# ENTRYPOINT ["bash", "/code/docker-entrypoint.sh"]