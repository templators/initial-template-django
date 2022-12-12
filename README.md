# initial-template-django
This repository aims to serve as an initial template for future Python projects.

This template is part of the tutorial "The Ultimate Guide to Setup your Development Environment and Start a Project"

## Usage
- Create a new GitHub repository and select this as a template. You also can also click on `Use this template` to create a new repository from this template.
- Copy the clone link the new repository you created.
- Go to Visual Studio Code, make sure you have `devcontainer` extension installed.
- Click on the devcontainer green icon in the left bottom corner and choose "Clone Repository in Container Volume..." and paste the clone link you copied from GitHub. Visual Studio Code will start a new development container and clone your GitHub repository in a volume.
- In order to setup a Kubernetes namespace to run your application in development, you need to store Okteto API token in environment variable in your running development container. To do, Go to your Okteto account or register for a new one in case you don't already have one. Go to Settings and generate a new "Personal Accesss Token". Back in VSC, Open an integrated terminal and store the token in a environment variable. To do, run `export OKTETO_TOKEN=<YOUR-OKTETO-TOKEN> && okteto kubeconfig`
This will download the kubeconfig file from Okteto and store it in `$HOME/.kube/config` in your running devcontainer.
- To browse your namespace in the terminal, you can use k9s (already installed in your devcontaoner)
Run `k9s`
- Rename `config.example` to `config`
- Store your application, database and object storage configurations in the `.env` files in the `config` directory. The config files are references in the `okteto.yml` manifest. The configurations in the `config` directory are meant to be used only for development. The configurations for production will be stored in configmaps and secrets a separate k8s manifest.
- In `okteto.yml` and `k8s.yml` replace all occurrences of `demo` with the name of your application. 
- Once all the configurations are setup, you should be ready to build and deploy the application to your Okteto's namespace. To do that, run `okteto deploy --build`
- Okteto offers you a way to do the development and change your code live in a separate pod running in your Okteto's namespace. To start development, run `okteto up` Your code source will be synced with the running pod in the Okteto's namespace.
- Now, you should have your development container activate. Okteto scales to zero the specified deployment and creates a mirror deployment. The mirror deployment is a copy of the original deployment manifest.
- In your development container, To build your database schema and apply the migrations, run `python manage.py migrate`
-  To collect your static files and store them in your configured object storage, run `python manage.py collectstatic`
- To run the django application, run `gunicorn --bind 0.0.0.0:8000 core.wsgi`
- Okteto will offer you and endpoint (secured url with https) to access your application. Visit your Okteto's dashboard.

## What this template includes?
devcontainer setup with kubernetes and okteto tools.
Initial django project with production-grade settings module.
Okteto manifest
Kubernetes deployment, service and ingress manifests.

