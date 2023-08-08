FROM nikolaik/python-nodejs:python3.11-nodejs16-slim

WORKDIR /code

COPY ./requirements.txt .

RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Create the frontend directory before copying the package.json
RUN mkdir frontend
COPY frontend/package.json frontend/

# Install Node.js dependencies for the frontend
RUN npm install --prefix frontend

# Copy the rest of the application code
COPY . .

# Build the frontend
RUN ls -l /code/frontend/public
RUN npm run build --prefix frontend

EXPOSE 3000
EXPOSE 8000

ENTRYPOINT ["bash", "/code/docker-entrypoint.sh"]
