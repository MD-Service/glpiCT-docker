# glpiCT-docker

## Construire une image

Cloner ce repo ainsi que le sous repos [glpiCT](https://github.com/MD-Service/glpiCT) avec la commande suivante:

    git clone --recurse-submodules -j8 git@github.com:MD-Service/glpiCT-docker.git 

## Construire l'image

Éxécuter le script build.sh avec des privilèges administrateur:

    ./build.sh

## Utilisation

### En ligne de commande:

Creer un volume persistant:

    docker volume create glpict_data

    docker run --rm -v glpict_data:/app --env GLPI_URL=http://domain.tld/glpi --env API_TOKEN=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX --env SEUIL_ALERT=80 --env SERVEUR_PORT=25 --env SERVEUR_SMTP=domain.tld glpict-docker:1.0

### Docker compose

Éditez le fichier docker-compose.yml:

    version: '3.3'
    services:
        glpict-docker:
            environment:
                - "GLPI_URL=http://domain.tld/glpi"              # URL de GLPI
                - "API_TOKEN=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"    # Token de l'API
                - "SEUIL_ALERT=80"                               # Seuil d'alerte en % avant de déclancher l'email
                - "SERVEUR_PORT=domain.tld"                      # Port du serveur email
	            - "SERVEUR_SMTP=25"                              # Adresse du serveur email
            volumes:
                - data:/app
            image: 'glpict-docker:1.0'
    volumes:
        data:


Lancer le container depuis le dossier avec la commade suivante:

    docker compose up -d