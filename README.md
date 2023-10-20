# glpiCT-docker

## Utilisation rapide

### En ligne de commande:

Creer un volume persistant:

    docker volume create glpict_data

    docker run --rm -v glpict_data:/app --env GLPI_URL=http://domain.tld/glpi --env API_TOKEN=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX --env SEUIL_ALERT=80 --env SERVEUR_PORT=25 --env SERVEUR_SMTP=domain.tld --env EMAIL_DEST=mail@example.com --env ADMIN_EMAIL=mail@example.com --env ADMIN_FROM_EMAIL=mail@example.com ghcr.io/md-service/glpict-docker:latest

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
                - "ADMIN_EMAIL=mail@example.com"                 # Adresse email de l'administrateur pour le debug
                - "ADMIN_FROM_EMAIL=mail@example.com"            # Adresse email de l'administrateur qui envoit l'alerte lors d'erreurs
            volumes:
                - data:/app
            image: 'ghcr.io/md-service/glpict-docker:latest'
    volumes:
        data:


Lancer le container depuis le dossier avec la commade suivante:

    docker compose up -d

## Construire une image

1. Cloner ce repo ainsi que le sous repos [glpiCT](https://github.com/MD-Service/glpiCT) avec la commande suivante:


       git clone --recurse-submodules -j8 git@github.com:MD-Service/glpiCT-docker.git 

3. Éxécuter le script build.sh avec des privilèges administrateur:

       cd glpiCT-docker
       ./build.sh

5. Lancer le conteneur comme dans les exemples ci-dessus. 
