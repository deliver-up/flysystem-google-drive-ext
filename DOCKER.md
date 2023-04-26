# Upgrade package using Docker

## Requirements
- Docker >4.18.0

## Install
```bash
# Go to project
cd path/to/package

# Build dedicated image for the package
docker build -t duweb-flysystem-google-drive-ext --no-cache .

# Run container to make upgrades
docker run --name duweb-flysystem-google-drive-ext --env-file ./.env.docker -v $(pwd):/var/www -d --tty duweb-flysystem-google-drive-ext
```

## Usage
You can use the container in different way:

### Editors / Terminal

#### VSCode
Open VSCode and using the command palette (cmd+shift+p), type `Docker Containers: Attach Shell` 
and select the **duweb-flysystem-google-drive-ext** container.

#### PHPStorm
Open project in PHPStorm and using the `Services` (cog icon on bottom left), 
select containers > duweb-flysystem-google-drive-ext > create terminal to attach a shell in the correct container

### Init
Once you have a terminal attached to the container, run:
```bash
# Init dependencies 
make init

# Launch PHPStan and Rector
make analyse

# Launch PEST
make test
```


