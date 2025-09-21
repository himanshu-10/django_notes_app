# Simple Notes App 
This is a simple notes app built with React and Django.

## Requirements
1. Python 3.9
2. Node.js
3. React

## Installation
1. Clone the repository
```
git clone <url>
```

2. Build the app
```
docker build -t notes-app .
```

3. Run the app
```
docker run -d -p 8000:8000 notes-app:latest
```

## Nginx

Install Nginx reverse proxy to make this application available

`sudo apt-get update`
`sudo apt install nginx`


## Architecture 

Design system with 3 container 
  1. Django (Backend API)
  2. MySQL (Database)
  3. Nginx (Web Server)

## Networking 

 Used a Docker network so all three containers can talk to each other securely.

## Data Persistence

   Add docker volume for MySQL so that the note data persists even if the DB container is removed or restart

   ```
volumes:
  - mysql-data:/var/lib/mysql

   ```
## Multistage Docker Build

  Stage 1: Built React frontend with node:18-alpine, producing optimized static files.

  Stage 2: Installed Django + dependencies (python:3.11-slim), collected static files.

  Stage 3 (Final): Combined everything → copied Django app + static frontend into a clean Python runtime, served using Gunicorn behind Nginx.
