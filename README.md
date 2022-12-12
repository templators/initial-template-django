# initial-template-django
This repository aims to serve as an initial template for future Python projects.

This template is part of the tutorial "The Ultimate Guide to Setup your Development Environment and Start a Project"

## Usage
- Create a new GitHub repository and select this as a template. You also can also click *Use this template* to create a new repository from this template.
- Copy the clone link.
- Go to Visual Studio Code, make sure you have `devcontainer` extension installed.
- Click on the devcontainer green icon in the left bottom corner and choose "Clone Repository in Container Volume" and paste the clone link you copied from GitHub. Visual Studio Code will start a new development container and clone your GitHub repository in a volume.
- To setup a Kubernetes namespace to run your application in development, you need to store Okteto API token in environment variable in your running development container. To do that, Go to your Okteto account or register for a new one in case you don't have already one. Go to Settings and generate a new "Personal Accesss Token". Open an integrated terminal in your VSC and store the token in a environment variable. To do that, run:
`export OKTETO_TOKEN=<YOUR-OKTETO-TOKEN> && okteto kubeconfig`
This will download the kubeconfig file from Okteto and store in `$HOME/.kube/config` in your running devcontainer.
- To browse your namespace in the terminal, you can use k9s (already installed in your devcontaoner)
Run `k9s`
- Rename `config.example` to `config`
- Store your application, database and object storage configurations in the `.env` files in the `config` directory. The files are references in the Okteto manifest and they are meant to be used only for development. The configurations for production will be stored in configmaps and secrets k8s manifests.
- Once all the configurations are setup, you should be ready to build and deploy the application to your Okteto's namespace. To do that, run `okteto deploy --build`
- Okteto offers you a way to do the development and change your code live in a separate pod running in your Okteto's namespace. To start development, run `okteto up` Your code source will be synced with the running pod in the Okteto's namespace.

## What this template includes?
devcontainer setup with kubernetes and okteto tools.
Initial django project with production-grade settings module.
Okteto manifest
Kubernetes deployment, service and ingress manifests.

