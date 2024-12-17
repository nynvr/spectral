# Spectral

A cloud-based tool utilizing msconvert to transform between various mass spectrometry data formats

# Tech stack

```
- Python: 3.12 (Double check root/.python-version and root/deploy/api/api.development.Dockerfile)
- Django: 5.1.1
- Django REST Framework: 3.15.2
- Node: 20.18 (Double check root/.nvmrc and root/deploy/web/web.development.Dockerfile)
- Next.js: 15.0.4
- NGINX: 1.25 (Double check root/deploy/nginx/nginx.development.Dockerfile)
- PostgreSQL: 1.25 (Double check root/deploy/nginx/nginx.development.Dockerfile)
```

# Getting started

- Clone the repo - `$ git clone git@github.com:nynvr/spectral.git`
- Go to repo root - `$ cd spectral`
- Install and start [Docker Desktop](https://www.docker.com/products/docker-desktop/). It will install both Docker and Docker Compose.
- Run Docker Compose
  - `$ docker compose -f docker-compose.development.yml up --build`
  - This will run 4 services,
    - api service
      - Django app
      - `http://0.0.0.0:81/`
      - `http://0.0.0.0:81/api/`
      - `http://0.0.0.0:81/api/auth/login`
      - `http://0.0.0.0:81/admin`
      - Create Django superuser
        - `$ docker exec -it {container-name} bash`
        - `$ python manage.py createsuperuser`
    - web service
      - Next.js app
      - `http://0.0.0.0:80/`
    - nginx service
      - NGINX
    - db service
      - PostgreSQL

# Setting up local development environment

- If we intend to just run (and not develop) the project, we don't need to set up the local environment. We can just follow the Getting started section
- If we intend to continue developing the project, we need to set up the local environment mainly because we want the IDE to be aware of the Python and Node packages requirements of our project allowing the IDE to perform code suggestions, completions, etc.
- Python
  - Install [pyenv](https://github.com/pyenv/pyenv?tab=readme-ov-file#installation) to setup the correct Python version for our project
  - Install Python version required by the project - `$ pyenv install x.x`
  - Use / switch to required Python version - `$ pyenv local x.x`
  - Print active Python version `$ pyenv version`
  - Install Python packages `$ pip install -r apps/api/app/requirements.txt`
- Node
  - Install [nvm](https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating) to setup the correct Node version for our project
  - Install Node version required by the project - `$ nvm install x.x`
  - Use / switch to required Node version - `$ nvm use x.x`
  - Print active Python version `$ nvm version`
  - Install Node packages `$ npm --prefix apps/web/app install`
- If we need to manage (update, remove, add) Python or Node packages, we need to do it inside the containers because we are using the environment that is in the container and not the host machine.
- To execute commands inside a running container and run bash shell commands, do this - `$ docker exec -it {container-name} bash`
- Since we are using Docker volumes, `requirements.txt` and `package.json and package-lock.json` files will be automatically updated.
- For Python, make sure to `$ pip freeze > requirements.txt` if we make changes to the project's packages. Don't forget to `$ pip install -r requirements.txt` in the local environment so that local Python environment gets updated.
- For Node, `$ npm install {package-name}` will automatically update the package.json and package-lock.json files. Don't forget to `$ npm install` in the local environment so that local Node environment gets updated.
- "Hot reload"
  - No need to "restart" the services to see code changes.
  - Docker Compose is using "volumes".
- Tailwind
  - To get rid of VS Code / Tailwind CSS / PostCSS warning, install PostCSS Language Support (VS Code Identifier: csstools.postcss)

# Documentation

- Use `Draw.io Integration` (VS Code Identifier: hediet.vscode-drawio) to document system architecture and, generally, create diagrams. The extension allows us to store our diagrams in our repository. Store them under `/docs` folder.
- Use `Kanbn Extension for Visual Studio Code` (VS Code Identifier: gordonlarrigan.vscode-kanbn) to manage our to do list. The extension allows us to store our to do list in our repository. It is based on Markdown.
  - We can just delete the `/.kanbn` folder if we don't use the extension.

# Pyenv commands

- `$ pyenv install x.x`
- `$ pyenv local x.x`
- `$ pyenv version`

# NVM commands

- `$ nvm install x.x`
- `$ nvm use x.x`
- `$ nvm version`

# Django commands

- `$ python manage.py makemigrations`
- `$ python manage.py migrate --no-input`
- `$ python manage.py createsuperuser`

# Docker commands

- `$ docker compose -f ./docker-compose.development.yml up`
- `$ docker compose -f ./docker-compose.development.yml down`
- `$ docker compose -f ./docker-compose.development.yml up --build`
- `$ docker compose -f ./docker-compose.development.yml build`
- `$ docker exec -it {container-name} bash`
- `$ docker logs --follow`
- `$ docker system prune -a`
- `$ docker image prune -a`
- `$ docker volume prune -a`
- `$ docker network prune`
- `$ docker container prune`
