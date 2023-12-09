# Django/React Boilerplate with TypeScript and Docker

## Introduction

Welcome to the Django/React Boilerplate repository! This project provides a solid foundation for building web applications using the Django backend framework, React frontend library, TypeScript for type-safe JavaScript, and Docker for containerization.

## Prerequisites

Ensure you have the following tools installed on your machine:

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Node.js](https://nodejs.org/) (for frontend development)
- [Python](https://www.python.org/) (for backend development)

## Getting Started

**Clone the repository:**

```bash
git clone https://github.com/VandaFarsad/django-react-boilerplate
cd django-react-boilerplate
```

**Start the application using Docker:**

```bash
docker compose up
```

The application will be accessible at:

- Backend (Django API): http://localhost:8000/
- Frontend (React App): http://localhost:3000/

For **production**, use the following command:

```bash
docker compose -f docker-compose.prod.yml up
```

**Create an environment file for production deployment:**

In order to deploy the application in production, create a `.env` file in the root directory. You can use [.env.local](.env.local) as a reference.

## Nginx in Production

For production, the Nginx service is used to serve the application. The Nginx configuration can be found in the [nginx](./nginx) directory.

Here is the GitHub repository for the Nginx image used in production: [JonasAlfredsson/docker-nginx-certbot](https://github.com/JonasAlfredsson/docker-nginx-certbot)

## Configuration

- Backend configuration files can be found in the `main` directory.
- Frontend configuration files can be found in the `frontend` directory.
- Nginx configuration for production is available in the `nginx` directory.

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

## Acknowledgments

- Thanks to Jonas Alfredsson for the Nginx and Certbot Docker image. [GitHub Repository](https://github.com/JonasAlfredsson/docker-nginx-certbot)
- Thanks to ChatGPT, for generating this README ;-)
